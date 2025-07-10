import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/main.components.dart';

part 'Dashboard/dashboard.screen.dart';
part 'Dashboard/controllers/dashboard.controller.dart';

part 'LiveTracking/live.tracking.screen.dart';
part 'LiveTracking/controllers/live.tracking.controller.dart';

part 'User/user.screen.dart';
part 'User/controllers/user.controller.dart';

List<String> _getLabelsForRange(ChartRange range) {
  switch (range) {
    case ChartRange.monthly:
      return [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'Mei',
        'Jun',
        'Jul',
        'Agu',
        'Sep',
        'Okt',
        'Nov',
        'Des',
      ];
    case ChartRange.yearly:
      return ['2020', '2021', '2022', '2023', '2024'];
    case ChartRange.daily:
      final now = DateTime.now();
      return List.generate(7, (i) {
        final d = now.subtract(Duration(days: 6 - i));
        return "${_shortDayName(d.weekday)} ${d.day}";
      });
  }
}

String _shortDayName(int weekday) {
  const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
  return days[(weekday - 1) % 7];
}
