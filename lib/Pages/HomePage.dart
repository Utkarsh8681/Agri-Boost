import 'package:agriboost/Pages/PredectedCrop.dart';
import 'package:agriboost/Pages/PredictPage.dart';
import 'package:agriboost/Pages/ProfilePage.dart';
import 'package:agriboost/Pages/SocialPage.dart';
import 'package:agriboost/Pages/WeatherPage.dart';
import 'package:agriboost/components/PredictButton.dart';
import 'package:agriboost/components/api.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const Weatherpage(),
    const Socialpage(),
    const Profile(),
    //  CropPredictorScreen()
  ];
  final List<String> _appBarTitles = [
    "AgriBoost",
    "Weather",
    "Social",
    "Profile",
    // ""
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: _appBarTitles[_selectedIndex] == "AgriBoost"
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.black), // or any icon you want
                  onPressed: () {
                    // Custom navigation logic
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const Homepage())); // or push to another page if needed
                  },
                ),
          shadowColor: Colors.grey,
          elevation: 10,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              _appBarTitles[_selectedIndex],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.more_vert),
                  )),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: const Color(0xfff7931A),
          showUnselectedLabels: true,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.home_outlined, color: Colors.grey[400], size: 30),
              activeIcon: const Icon(Icons.home, color: Colors.black, size: 35),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined,
                  color: Colors.grey[400], size: 30),
              activeIcon:
                  const Icon(Icons.category, color: Colors.black, size: 35),
              label: "Weather",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline, color: Colors.grey[400], size: 30),
              activeIcon: const Icon(Icons.mail, color: Colors.black, size: 35),
              label: "Social",
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.person_outline, color: Colors.grey[400], size: 30),
              activeIcon:
                  const Icon(Icons.person, color: Colors.black, size: 35),
              label: "Profile",
            ),
          ],
        ),
        body: _screens[_selectedIndex],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final WeatherFactory wf = WeatherFactory(BaseURL);

    Weather? weather;

    @override
    void initState() {
      super.initState();
      wf.currentWeatherByCityName("Ghaziabad").then((w) {
        setState(() {
          weather = w;
        });
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              // color: Colors.red, // Placeholder color
              child: Image.asset(
                "assets/banner.jpg",
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  " Hey, Utkarsh \n It's a Clear Sky",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Select Location"),
                          content: const TextField(
                            // controller: location,
                            decoration: InputDecoration(
                              hintText: "Search city...",
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                // location = location;
                                print("Confirmed!"); // Perform desired action
                                Navigator.of(context).pop(); // Close dialog
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.green[800],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Location",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Column(
                children: [
                  ApiFetch(
                    cityName: "Ghaziabad",
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                          builder: (Context) => Predictedcrops()));
                },
                child: const ContainerButton()),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          )
        ],
      ),
    );
  }
}
