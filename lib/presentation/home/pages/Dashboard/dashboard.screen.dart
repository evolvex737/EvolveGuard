part of '../main.pages.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
               () =>  TopBar(
                selectedRange: controller.chartRange.value,
                onPressed: (range) {
                  controller.chartRange.value = range;
                },
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 210,
              child: Obx(
                () => GraphArea(
                  selectedRange: controller.chartRange.value,
                  spots1: controller.spots1,
                  spots2: controller.spots2,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const OngoingCalls(),
          ],
        ),
      ),
    );
  }
}
