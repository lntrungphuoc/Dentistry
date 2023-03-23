import 'dart:io';

import 'package:app_dentristy_mobile/core/widget/side_menu.dart';
import 'package:app_dentristy_mobile/feature/account/login/binding/login_binding.dart';
import 'package:app_dentristy_mobile/feature/account/login/view/login_view.dart';
import 'package:app_dentristy_mobile/feature/account/profile/view/profile_view.dart';
import 'package:app_dentristy_mobile/feature/doctor/binding/doctor_binding.dart';
import 'package:app_dentristy_mobile/feature/doctor/view/doctor_detail_view.dart';
import 'package:app_dentristy_mobile/feature/doctor/view/list_doctor_view.dart';
import 'package:app_dentristy_mobile/feature/health_book_detail/view/health_book_detail_view.dart';
import 'package:app_dentristy_mobile/feature/make-appointment/binding/make_appointment_binding.dart';
import 'package:app_dentristy_mobile/feature/make-appointment/view/make-appointment-view.dart';
import 'package:app_dentristy_mobile/feature/price_list/binding/price_list_binding.dart';
import 'package:app_dentristy_mobile/feature/price_list/view/price_list_view.dart';
import 'package:app_dentristy_mobile/feature/service_list/binding/service_binding.dart';
import 'package:app_dentristy_mobile/feature/service_list/view/service_detail_view.dart';
import 'package:app_dentristy_mobile/feature/service_list/view/service_list_view.dart';
import 'package:app_dentristy_mobile/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/health_book/view/health_book_view.dart';
import 'feature/home/binding/home_binding.dart';
import 'feature/home/view/home_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SideMenu(),
      getPages: [
        GetPage(name: '/home', page: () => HomeView(), binding: HomeBinding()),
        GetPage(
            name: '/service',
            page: () => const ServiceListView(),
            binding: ServiceBinding()),
        GetPage(
            name: '/doctor',
            page: () => const ListDoctorView(),
            binding: DoctorBinding()),
        GetPage(
            name: '/price_list',
            page: () => const PriceListView(),
            binding: PriceListBinding()),
        GetPage(name: '/doctor_detail', page: () => const DoctorDetailView()),
        GetPage(
            name: '/make_appointment',
            page: () => MakeAppointmentView(),
            binding: MakeAppointmentBinding()),
        GetPage(name: '/health_book', page: () => const HealthBookView()),
        GetPage(
            name: '/health_book_detail', page: () => const HealthBookDetailView()),
        GetPage(name: '/splash', page: () => const SplashView()),
        GetPage(
            name: '/login', page: () => LoginView(), binding: LoginBinding()),
        GetPage(name: '/profile', page: () => const ProfileView()),
        // GetPage(name: '/service_detail', page: () => ServiceDetailView())
      ],
      initialRoute: '/splash',
    );
  }
}
