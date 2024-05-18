import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/widgets/tool_button.dart';

import '../model/sudoku_field_model.dart';

class ToolPanel extends StatelessWidget {
  const ToolPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SudokuFieldModel>(
        builder: (BuildContext context, value, Widget? child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToolButton(
            func: () => value.removeCell(),
            icon: const Icon(Icons.remove, size: 35),
          ),
          const SizedBox(width: 30),
          ToolButton(
            func: () => value.getTip(),
            icon: const Icon(Icons.question_mark, size: 30),
          )
        ],
      );
    });
  }
}
