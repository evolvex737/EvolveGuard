part of 'controllers_bindings.dart';
class UserControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
