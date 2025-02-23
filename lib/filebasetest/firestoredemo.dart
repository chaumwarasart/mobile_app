import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: products.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        final data = snapshot.data!.docs;
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final product = data[index];
            String productId = product.id; // ดึงค่า ID ของเอกสาร
            return ListTile(
              leading: Text(productId),
              title: Text(product['name']),
              subtitle: Text(product['description']),
            );
          },
        );
      },
    ));
  }
}
