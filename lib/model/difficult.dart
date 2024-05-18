import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

enum Difficult {
  easy('Easy', AppColor.green, 0.3),
  normal('Normal', AppColor.yellow, 0.6),
  hard('Hard', AppColor.red, 0.8);

  const Difficult(this.name, this.color, this.percent);

  final String name;
  final Color color;
  final double percent;
}
