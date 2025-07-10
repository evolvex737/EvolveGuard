import 'package:get/get.dart';
import 'package:monitoring/infrastructure/navigation/main.navigation.dart';

class AuthController extends GetxController {
  //todo: Implement AuthController

  final count = 0.obs;
  final email = ''.obs;
  final password = ''.obs;
  final isVerified = false.obs;
  final isLoggedIn = false.obs;
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
    logout();
  }

  void increment() => count.value++;
  void login() {
    if (email.value.isNotEmpty && password.value == 'password123') {
      // Dummy verifikasi email
      if (email.value.endsWith('@verified.com')) {
        isVerified.value = true;
        isLoggedIn.value = true;
        Get.offAllNamed(Routes.home);
      } else {
        Get.snackbar('Verifikasi Diperlukan', 'Email belum terverifikasi',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Login Gagal', 'Email atau password salah',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() {
    isLoggedIn.value = false;
    isVerified.value = false;
    email.value = '';
    password.value = '';
    // Get.offAllNamed('/auth');
  }
}
