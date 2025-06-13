import 'package:get/get.dart';
import '../pages/landing_page.dart';
import '../pages/registration_page.dart';
import '../pages/success_page.dart';
import '../pages/registrations_list_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => LandingPage()),
    GetPage(name: '/register', page: () => RegistrationPage()),
    GetPage(name: '/success', page: () => SuccessPage()),
    GetPage(name: '/registrations', page: () => RegistrationsListPage()),
  ];
}
