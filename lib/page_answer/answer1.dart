import 'package:flutter/material.dart';



class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid Layout"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 169, 160, 160), // พื้นหลังสีชมพูอ่อน
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row แถวที่ 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                const SizedBox(width: 20), // ระยะห่างระหว่างกล่อง
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                const SizedBox(width: 20), // ระยะห่างระหว่างกล่อง
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20), // ระยะห่างระหว่างแถว
            // Row แถวที่ 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                ),
                const SizedBox(width: 20), // ระยะห่างระหว่างกล่อง
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.purple,
                ),
                const SizedBox(width: 20), // ระยะห่างระหว่างกล่อง
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
