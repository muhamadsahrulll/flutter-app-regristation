import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/registration_model.dart';

class RegistrationsListController extends GetxController {
  var registrations = <Registration>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRegistrations();
    super.onInit();
  }

  void fetchRegistrations() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('http://localhost:5000/registrations'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        registrations.value = data.map((e) => Registration.fromJson(e)).toList();
      } else {
        Get.snackbar("Error", "Gagal mengambil data");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  String maskEmail(String email) {
    final parts = email.split('@');
    final name = parts[0];
    final domain = parts[1];

    final visible = name.length >= 2 ? name.substring(0, 2) : name;
    return '$visible***@${domain}';
  }

  String maskName(String name) {
    if (name.length <= 1) return "*";
    return name[0] + "*" * (name.length - 1);
  }

  String maskAddress(String address) {
    if (address.length <= 3) return "*" * address.length;
    return address.substring(0, 5) + "*" * (address.length - 5);
  }
}
