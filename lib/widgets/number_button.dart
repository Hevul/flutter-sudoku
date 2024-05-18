import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/constants/app_colors.dart';
import 'package:sudoku/model/sudoku_field_model.dart';

class NumberButton extends StatefulWidget {
  final String number;

  const NumberButton({
    super.key,
    required this.number,
  });

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SudokuFieldModel>(
        builder: (BuildContext context, value, Widget? child) {
      bool isCompletedNumber = value.isCompletedNumber(widget.number);

      return Opacity(
        opacity: isCompletedNumber ? 0 : 1,
        child: Container(
          width: 35,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                color: AppColor.primary50,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(1, 2)),
          ], borderRadius: BorderRadius.circular(8), color: AppColor.primary),
          child: InkWell(
            onTap: isCompletedNumber
                ? null
                : () => value.setNumberInCell(widget.number),
            child: Text(widget.number,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondary50)),
          ),
        ),
      );
    });
  }
}
