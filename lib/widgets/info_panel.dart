import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/sudoku_field_model.dart';

import '../constants/app_colors.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SudokuFieldModel>(
      builder: (BuildContext context, SudokuFieldModel value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _label('${value.mistakes} / 3'),
            _label(value.difficult.name),
          ],
        );
      }
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: AppColor.primary15
      )
    );
  }

}
