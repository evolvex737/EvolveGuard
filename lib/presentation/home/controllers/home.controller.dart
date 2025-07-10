import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/main.components.dart';

class HomeController extends GetxController {
  //todo: Implement HomeController

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static HomeController instance = Get.find();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void navigateTo(String routeName) {
    final navigator = navigatorKey.currentState!;

    // Tampilkan loader
    navigator.push(
      RawDialogRoute(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoaderContent(),
        barrierDismissible: false,
        barrierColor: Colors.transparent,
      ),
    );
    // Delay singkat lalu pop dan pushNamed
    Future.delayed(
      const Duration(milliseconds: 320),
      () => navigator.popAndPushNamed(routeName), // Navigasi ke halaman
    );
  }

  void goBack() => navigatorKey.currentState?.pop();
}
