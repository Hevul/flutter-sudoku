import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../model/sudoku_field_model.dart';

class ToolButton extends StatelessWidget {
  final VoidCallback func;
  final Icon icon;
  const ToolButton({super.key, required this.func, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Consumer<SudokuFieldModel>(
        builder: (BuildContext context, value, Widget? child) {
      return InkWell(
        onTap: () => func(),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: AppColor.primary50,
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(1, 2)),
              ]),
          child: icon,
        ),
      );
    });
  }
}
