part of 'controllers_bindings.dart';

class LiveTrackingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveTrackingController>(
      () => LiveTrackingController(),
    );
  }
}
