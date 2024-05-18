import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/difficult.dart';

import '../constants/app_colors.dart';
import '../model/sudoku_field_model.dart';

class NewGameButton extends StatelessWidget {
  final Difficult difficult;

  const NewGameButton({super.key, required this.difficult});

  @override
  Widget build(BuildContext context) {
    return Consumer<SudokuFieldModel>(
        builder: (BuildContext context, value, Widget? child) {
      return InkWell(
        onTap: () => value.newGame(difficult),
        child: Container(
          height: 45,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: AppColor.primary50,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1)),
              ]),
          child: Text(
            difficult.name,
            style: TextStyle(fontSize: 20, color: difficult.color),
          ),
        ),
      );
    });
  }
}
