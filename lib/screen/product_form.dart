import 'package:flutter/material.dart';
import '/api_product.dart';
import '/product.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;
  final VoidCallback onSave;

  const ProductFormScreen({super.key, this.product, required this.onSave});

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _descController =
        TextEditingController(text: widget.product?.description ?? '');
    _priceController =
        TextEditingController(text: widget.product?.price.toString() ?? '');
  }

  void _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      Product product = Product(
        id: widget.product?.id ?? 0,
        name: _nameController.text,
        description: _descController.text,
        price: double.parse(_priceController.text),
      );

      if (widget.product == null) {
        await ApiService.addProduct(product);
      } else {
        await ApiService.updateProduct(product);
      }

      widget.onSave();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product saved successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Form"),
        backgroundColor: const Color.fromARGB(255, 235, 157, 0), // เปลี่ยนสี AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Input with rounded border and shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a product name.";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Description Input with rounded border and shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _descController,
                  decoration: InputDecoration(
                    labelText: "Product Description",
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a description.";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Price Input with rounded border and shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: "Product Price",
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the product price.";
                    }
                    if (double.tryParse(value) == null) {
                      return "Please enter a valid price.";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Save Button with rounded corners and custom color
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 255, 98), // ใช้สีเดียวกับ AppBar
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Save Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
