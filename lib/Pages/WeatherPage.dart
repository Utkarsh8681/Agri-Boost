import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

const String API_KEY = '8536cb954c9621497c798aa01fc10271';
final WeatherFactory wf = WeatherFactory(API_KEY);

class StyledWeatherScreen extends StatefulWidget {
  final String cityName;

  const StyledWeatherScreen({super.key, required this.cityName});

  @override
  State<StyledWeatherScreen> createState() => _StyledWeatherScreenState();
}

class _StyledWeatherScreenState extends State<StyledWeatherScreen> {
  Weather? _current;
  List<Weather>? _forecast;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    try {
      Weather current = await wf.currentWeatherByCityName(widget.cityName);
      List<Weather> forecast =
          await wf.fiveDayForecastByCityName(widget.cityName);
      setState(() {
        _current = current;
        _forecast = forecast;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 230, 204),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _current == null || _forecast == null
              ? const Center(child: Text("Unable to fetch data"))
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildCurrentWeatherCard(),
                        const SizedBox(height: 20),
                        _buildHourlyForecast(),
                        // const SizedBox(height: 20),
                        _buildDailyForecast(),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildCurrentWeatherCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 107, 179, 110),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            DateFormat('EEE, MMM d, HH:mm').format(_current!.date!),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Image.network(
            "http://openweathermap.org/img/wn/${_current!.weatherIcon}@2x.png",
            height: 60,
          ),
          Text(
            "${_current!.temperature?.celsius?.toStringAsFixed(1)}°C",
            style: const TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "${_current!.tempMax?.celsius?.toStringAsFixed(0)}° / ${_current!.tempMin?.celsius?.toStringAsFixed(0)}°",
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            _current!.weatherDescription ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyForecast() {
    final now = DateTime.now();

    // Get forecast entries that are from today AND in the future
    List<Weather> threeHourForecast = _forecast!
        .where((w) =>
            w.date != null && w.date!.isAfter(now) && w.date!.day == now.day)
        .take(6) // Take next 6 intervals (3 hours each = 18 hours total)
        .toList();

    if (threeHourForecast.isEmpty) {
      return const Center(
          child: Text(""
              // "No 3-hour forecast available"
              ));
    }

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: threeHourForecast.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final weather = threeHourForecast[index];
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(blurRadius: 4, color: Colors.grey.shade300)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weather.date != null
                      ? DateFormat.Hm().format(weather.date!)
                      : "--:--",
                ),
                if (weather.weatherIcon != null)
                  Image.network(
                    "http://openweathermap.org/img/wn/${weather.weatherIcon}.png",
                    height: 30,
                  )
                else
                  const Icon(Icons.cloud_off),
                Text(
                    "${weather.temperature?.celsius?.toStringAsFixed(0) ?? '--'}°C"),
                Text("${weather.windSpeed?.toStringAsFixed(0) ?? '--'} m/s",
                    style: const TextStyle(fontSize: 10)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDailyForecast() {
    Map<String, Weather> daily = {};

    for (var weather in _forecast!) {
      String day = DateFormat('EEEE').format(weather.date!);
      // Only one forecast per day around noon
      for (var weather in _forecast!) {
        String day = DateFormat('EEEE').format(weather.date!);
        if (!daily.containsKey(day)) {
          daily[day] = weather;
        } else {
          final existing = daily[day]!;
          if ((weather.date!.hour - 12).abs() <
              (existing.date!.hour - 12).abs()) {
            daily[day] = weather;
          }
        }
      }
      {
        daily[day] = weather;
      }
    }

    return Expanded(
      child: ListView(
        children: daily.entries.map((entry) {
          final day = entry.key;
          final weather = entry.value;

          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: Image.network(
              "http://openweathermap.org/img/wn/${weather.weatherIcon}.png",
              height: 30,
            ),
            title: Text(day),
            subtitle: Text(
                "💧 ${weather.humidity}%  💨 ${weather.windSpeed?.toStringAsFixed(1)} m/s"),
            trailing: Text(
              "${weather.tempMax?.celsius?.toStringAsFixed(0)}° / ${weather.tempMin?.celsius?.toStringAsFixed(0)}°",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:weather/weather.dart';
// import 'package:intl/intl.dart';

// const String API_KEY = '8536cb954c9621497c798aa01fc10271';
// final WeatherFactory wf = WeatherFactory(API_KEY);

// class WeatherScreen extends StatefulWidget {
//   final String cityName;

//   const WeatherScreen({super.key, required this.cityName});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   Weather? _weather;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchWeather();
//   }

//   void fetchWeather() async {
//     try {
//       Weather weather = await wf.currentWeatherByCityName(widget.cityName);
//       setState(() {
//         _weather = weather;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error fetching weather: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _weather == null
//               ? const Center(child: Text("Unable to fetch weather data"))
//               : Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       // City & Icon
//                       Column(
//                         children: [
//                           Text(
//                             _weather!.areaName ?? "Unknown",
//                             style: const TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           if (_weather!.weatherIcon != null)
//                             Image.network(
//                               "http://openweathermap.org/img/wn/${_weather!.weatherIcon}@4x.png",
//                               height: 100,
//                             ),
//                           Text(
//                             _weather!.weatherDescription ?? "",
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),

//                       // Temperature
//                       Text(
//                         _weather!.temperature?.celsius != null
//                             ? "${_weather!.temperature!.celsius!.toStringAsFixed(1)}°C"
//                             : "N/A",
//                         style: const TextStyle(
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blueAccent,
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Weather Details Grid
//                       Expanded(
//                         child: GridView.count(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 16,
//                           crossAxisSpacing: 16,
//                           children: [
//                             _buildInfoCard(
//                                 "Humidity",
//                                 _weather!.humidity != null
//                                     ? "${_weather!.humidity}%"
//                                     : "N/A"),
//                             _buildInfoCard(
//                                 "Wind Speed",
//                                 _weather!.windSpeed != null
//                                     ? "${_weather!.windSpeed} m/s"
//                                     : "N/A"),
//                             _buildInfoCard(
//                                 "Pressure",
//                                 _weather!.pressure != null
//                                     ? "${_weather!.pressure} hPa"
//                                     : "N/A"),
//                             _buildInfoCard(
//                                 "Sunrise",
//                                 _weather!.sunrise != null
//                                     ? _formatTime(_weather!.sunrise!)
//                                     : "N/A"),
//                             _buildInfoCard(
//                                 "Sunset",
//                                 _weather!.sunset != null
//                                     ? _formatTime(_weather!.sunset!)
//                                     : "N/A"),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//     );
//   }

//   Widget _buildInfoCard(String label, String value) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [
//           BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2)),
//         ],
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(label,
//               style:
//                   const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//           const SizedBox(height: 10),
//           Text(value,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }

//   String _formatTime(DateTime time) {
//     return DateFormat('h:mm a').format(time);
//   }
// }
