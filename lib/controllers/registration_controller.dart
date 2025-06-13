import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();

  void submitForm() async {
  final name = nameController.text.trim();
  final email = emailController.text.trim();
  final address = addressController.text.trim();

  final response = await http.post(
    Uri.parse('http://localhost:5000/register'), // Ganti dengan IP backend Anda
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': name,
      'email': email,
      'address': address,
    }),
  );

  if (response.statusCode == 200) {
    Get.toNamed('/success');
  } else {
    final error = jsonDecode(response.body)['error'];
    Get.snackbar("Gagal", error);
  }
}

}
