import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  const Answer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Social Media Post'),
          backgroundColor: Colors.orange,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous page
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // รูปโปรไฟล์
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // ชื่อผู้ใช้งานและเวลาโพสต์
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'User Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '5 minutes ago',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // พื้นที่โพสต์
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 10),
              // ปุ่ม Like, Comment, Share
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Like'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Comment'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Share'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
