import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8001/products";

  // ดึงข้อมูลสินค้าทั้งหมด
  static Future<List<dynamic>> fetchProducts() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  // เพิ่มสินค้าใหม่
  static Future<void> createProduct(Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        print("Product added successfully!");
      } else {
        throw Exception("Failed to create product");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // แก้ไขสินค้า
  static Future<void> updateProduct(String id, Map<String, dynamic> data) async {
    try {
      var response = await http.put(
        Uri.parse("$baseUrl/$id"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print("Product updated successfully!");
      } else {
        throw Exception("Failed to update product");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // ลบสินค้า
  static Future<void> deleteProduct(String id) async {
    try {
      var response = await http.delete(Uri.parse("$baseUrl/$id"));

      if (response.statusCode == 200) {
        print("Product deleted successfully!");
      } else {
        throw Exception("Failed to delete product");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}