import 'package:flutter/material.dart';
import 'package:mobile_app/widget_nigth_light/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // เริ่มต้นที่โหมด Light

  void _toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode, // ใช้ตัวแปร themeMode
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Example'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                _themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: const Center(
          child: ProfileCard (
            name: 'Chonpasu Chaumwarasart-650710234',
            position: 'Student',
            email: 'chonpasu@gmail.com',
            phoneNumber: '0966801523',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdG7NsVp6h2aNjLcCVIVu-nJ1rK2WMzVFC7g&s',)
        ),
      ),
    );
  }
}
