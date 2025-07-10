part of '../../main.pages.dart';

class LiveTrackingController extends GetxController {
  //todo: Implement LiveTrackingController

  final chartRange = ChartRange.daily.obs;
  final spots1 = RxList<FlSpot>();
  final spots2 = RxList<FlSpot>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _generateDummyChartData(); // awal
    ever(chartRange, (_) => _generateDummyChartData()); // update saat berubah
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
  void _generateDummyChartData() {
    final labels = _getLabelsForRange(chartRange.value);
    spots1.assignAll(
      List.generate(
        labels.length,
        (i) => FlSpot(i.toDouble(), 2 + Random().nextDouble()),
      ),
    );
    spots2.assignAll(
      List.generate(
        labels.length,
        (i) => FlSpot(i.toDouble(), 1.8 + Random().nextDouble()),
      ),
    );
  }
}
