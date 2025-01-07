import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Product Layout"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous page
            },
          ),
        ),
        body: const ProductPage(),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 50,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 213, 210, 210),  // สีพื้นหลังที่ต้องการ
              borderRadius: BorderRadius.circular(8),  // รูปทรงมุมโค้ง
            ),
            child: const Text(
              "Category: Electronics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,  // สีของข้อความ
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                ProductDetail(
                  imgPath: "assets/images/laptop.jpg",
                  name: "Laptop",
                  price: "999 THB",
                ),
                ProductDetail(
                  imgPath: "assets/images/smartphone.jpg",
                  name: "Smartphone",
                  price: "899 THB",
                ),
                ProductDetail(
                  imgPath: "assets/images/tablet.jpg",
                  name: "Tablet",
                  price: "499 THB",
                ),
                ProductDetail(
                  imgPath: "assets/images/camera.jpg",
                  name: "Camera",
                  price: "299 THB",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String imgPath;
  final String name;
  final String price;

  const ProductDetail({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imgPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}