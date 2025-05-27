// Inside Homepage.dart

import 'package:agriboost/Pages/PredectedCrop.dart';
import 'package:agriboost/Pages/PredictPage.dart';
import 'package:agriboost/Pages/ProfilePage.dart';
import 'package:agriboost/Pages/WeatherPage.dart';
import 'package:agriboost/components/PredictButton.dart';
import 'package:agriboost/components/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

const BaseURL = '8536cb954c9621497c798aa01fc10271';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  String currentCity = "Ghaziabad";
  final TextEditingController locationController = TextEditingController();

  final WeatherFactory wf = WeatherFactory(BaseURL);
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    fetchWeather(currentCity);
  }

  void fetchWeather(String city) {
    wf.currentWeatherByCityName(city).then((w) {
      setState(() {
        _weather = w;
        currentCity = city;
      });
    });
  }

  List<Widget> getScreens() {
    return [
      HomeScreen(
        onCityChanged: (city) => fetchWeather(city),
        currentCity: currentCity,
        locationController: locationController,
      ),
      StyledWeatherScreen(cityName: currentCity),
      const Predictedcrops(),
      const Profile(),
    ];
  }

  final List<String> _appBarTitles = [
    "AgriBoost",
    "Weather",
    "Crops",
    "Profile",
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = getScreens();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: _appBarTitles[_selectedIndex] == "AgriBoost"
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage()),
                  );
                },
              ),
        title: Text(
          _appBarTitles[_selectedIndex],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xfff7931A),
        showUnselectedLabels: true,
        showSelectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            activeIcon: Icon(
              Icons.home,
              size: 35,
              color: Colors.green,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined, size: 30),
            activeIcon: Icon(Icons.category, size: 35, color: Colors.green),
            label: "Weather",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture, size: 30),
            activeIcon: Icon(Icons.mail, size: 35, color: Colors.green),
            label: "Crops",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30),
            activeIcon: Icon(Icons.person, size: 35, color: Colors.green),
            label: "Profile",
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Function(String) onCityChanged;
  final String currentCity;
  final TextEditingController locationController;

  const HomeScreen({
    super.key,
    required this.onCityChanged,
    required this.currentCity,
    required this.locationController,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final WeatherFactory wf;
  Weather? weather;

  @override
  void initState() {
    super.initState();
    wf = WeatherFactory(BaseURL);
    fetchWeather(widget.currentCity);
  }

  void fetchWeather(String city) {
    wf.currentWeatherByCityName(city).then((w) {
      setState(() {
        weather = w;
      });
      widget.onCityChanged(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset("assets/wp.jpg"),
              Image.asset("assets/boost.jpg"),
              Image.asset("assets/banner_agri.jpg"),
              Image.asset("assets/agri_banner.jpg"),
            ],
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              initialPage: _currentIndex,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.green : Colors.grey,
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hey, Utkarsh\n${weather?.weatherDescription ?? "Fetching weather..."}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Select Location"),
                          content: TextField(
                            controller: widget.locationController,
                            decoration: const InputDecoration(
                              hintText: "Search city...",
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                if (widget.locationController.text.isNotEmpty) {
                                  fetchWeather(widget.locationController.text);
                                }
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.green[800],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.white, size: 30),
                        const SizedBox(width: 10),
                        Text(
                          widget.locationController.text.isNotEmpty
                              ? widget.locationController.text
                              : widget.currentCity,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ApiFetch(cityName: widget.currentCity),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CropPredictionScreen(),
                  ),
                );
              },
              child: const ContainerButton(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
