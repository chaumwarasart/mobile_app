import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyAir());
}

class MyAir extends StatelessWidget {
  const MyAir({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AQIPage(),
    );
  }
}

class AQIPage extends StatefulWidget {
  @override
  _AQIPageState createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {
  String city = "Loading...";
  int aqi = 0;
  double temperature = 0.0;
  bool isLoading = true;

  Future<void> fetchAQI() async {
    const String token = "b8ab31ee51b727fe1a1d579e878bf7fb5dab2805"; // ใส่ Token ที่ได้จาก https://aqicn.org/data-platform/token/
    const String cityName = "bangkok";
    final String url = "https://api.waqi.info/feed/$cityName/?token=$token";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          city = data['data']['city']['name'];
          aqi = data['data']['aqi'];
          temperature = data['data']['iaqi']['t']['v'];
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load AQI data");
      }
    } catch (e) {
      setState(() {
        city = "Error";
        aqi = 0;
        temperature = 0.0;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAQI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Air Quality Index (AQI)"),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    city,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: aqi > 100 ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "$aqi",
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    aqi > 100 ? "Unhealthy" : "Good",
                    style: TextStyle(fontSize: 24, color: aqi > 100 ? Colors.red : Colors.green),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Temperature: ${temperature.toStringAsFixed(1)}°C",
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchAQI,
                    child: const Text("Refresh"),
                  ),
                ],
              ),
      ),
    );
  }
}