import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/constants/app_colors.dart';
import 'package:sudoku/widgets/cell.dart';

import '../model/point.dart';

class GameField extends StatelessWidget {
  const GameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: AppColor.background,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 81,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 9,
        ),
        itemBuilder: (BuildContext context, int index) {
          final point = Point(index ~/ 9, index % 9);
          return Cell(point: point);
        },
      ),
    );
  }
}
