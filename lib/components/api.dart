import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class ApiFetch extends StatefulWidget {
  const ApiFetch({super.key, required this.cityName});

  final String cityName;

  @override
  State<ApiFetch> createState() => _ApiFetchState();
}

const BaseURL = '8536cb954c9621497c798aa01fc10271';

class _ApiFetchState extends State<ApiFetch> {
  final WeatherFactory wf = WeatherFactory(BaseURL);

  Weather? _weather;

  @override
  void initState() {
    super.initState();
    wf.currentWeatherByCityName("Ghaziabad").then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Current Weather",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  _weather?.areaName ?? "",
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}\u00B0C",
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      "${_weather?.weatherDescription}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.cloud_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                // _weatherIcon()
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Humidity",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text("${_weather?.humidity?.toStringAsFixed(0)}%",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Wind",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text("${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Rainfall",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Text("${_weather?.rainLast3Hours?.toStringAsFixed(0)}",
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _weatherIcon() {
    if (_weather?.weatherIcon == null) {
      return Container(
        child: const Icon(Icons.error,
            size: 50, color: Colors.red), // Fallback icon
      );
    } else {
      return Container(
        height: 70,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "http://openweathermap.org/img/wn/${_weather!.weatherIcon}@4x.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
