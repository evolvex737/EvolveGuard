part of '../main.pages.dart';

class LiveTrackingScreen extends GetView<LiveTrackingController> {
  const LiveTrackingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderTile(
            title: "Call Graph",
            subtitle: "Statistik panggilan harian & mingguan",
            icon: Icons.show_chart,
          ),
          SizedBox(height: 24),
          Obx(
            () => TopBar(
              selectedRange: controller.chartRange.value,
              onPressed: (range) {
                controller.chartRange.value = range;
              },
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Obx(
              () => GraphArea(
                selectedRange: controller.chartRange.value,
                spots1: controller.spots1,
                spots2: controller.spots2,
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
