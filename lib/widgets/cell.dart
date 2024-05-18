import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../model/point.dart';
import '../model/sudoku_field_model.dart';

class Cell extends StatefulWidget {
  final Point point;

  const Cell({super.key, required this.point});

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  final double borderRadius = 15;

  @override
  Widget build(BuildContext context) {
    int row = widget.point.row;
    int column = widget.point.column;
    bool isTopLeft = row == 0 && column == 0;
    bool isTopRight = row == 0 && column == 8;
    bool isBottomLeft = row == 8 && column == 0;
    bool isBottomRight = row == 8 && column == 8;

    return Consumer<SudokuFieldModel>(
      builder: (BuildContext context, value, Widget? child) {
        bool isSelectedNumber = _isSelectedNumber(widget.point, value);
        bool isSelectedRowOrColumnOrSquare = _isSelectedRowOrColumnOrSquare(widget.point, value);
        bool isSelectedCell = widget.point == value.currentCell;
        bool isInvalidCell = value.isInvalidCell(widget.point);
        bool isInsertedCell = value.isInsertedCell(widget.point);

        return InkWell(
          onTap: () => value.currentCell = widget.point,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: _getCellColor(
                    isInvalidCell: isInvalidCell,
                    isSelectedCell: isSelectedCell,
                    isSelectedNumber: isSelectedNumber,
                    isSelectedRowOrColumnOrSquare:
                        isSelectedRowOrColumnOrSquare),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isTopLeft ? borderRadius : 0),
                  topRight: Radius.circular(isTopRight ? borderRadius : 0),
                  bottomLeft: Radius.circular(isBottomLeft ? borderRadius : 0),
                  bottomRight:
                      Radius.circular(isBottomRight ? borderRadius : 0),
                ),
                border: Border(
                    top: _getBorderSide(side: 'top', point: widget.point),
                    right: _getBorderSide(side: 'right', point: widget.point),
                    bottom: _getBorderSide(side: 'bottom', point: widget.point),
                    left: _getBorderSide(side: 'left', point: widget.point))),
            alignment: Alignment.center,
            child: Text(value.field[row][column],
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: _getTextColor(
                        isInvalidCell: isInvalidCell,
                        isInsertedCell: isInsertedCell))),
          ),
        );
      },
    );
  }

  BorderSide _getBorderSide({required String side, required Point point}) {
    switch (side) {
      case 'top':
        return BorderSide(
            color: AppColor.primary25, width: point.row % 3 == 0 ? 1.5 : 0.3);
      case 'right':
        return BorderSide(
            color: AppColor.primary25,
            width: point.column % 3 == 2 ? 1.5 : 0.3);
      case 'bottom':
        return BorderSide(
            color: AppColor.primary25, width: point.row == 8 ? 1.5 : 0.3);
      case 'left':
        return BorderSide(
            color: AppColor.primary25, width: point.column == 0 ? 1.5 : 0.3);
      default:
        return BorderSide.none;
    }
  }

  Color _getCellColor(
      {required bool isInvalidCell,
      required bool isSelectedCell,
      required bool isSelectedNumber,
      required bool isSelectedRowOrColumnOrSquare}) {
    return isInvalidCell
        ? AppColor.tertiary
        : isSelectedCell || isSelectedNumber
            ? AppColor.secondary
            : isSelectedRowOrColumnOrSquare
                ? AppColor.primary75
                : AppColor.primary;
  }

  Color _getTextColor({required bool isInvalidCell, required isInsertedCell}) {
    return isInvalidCell
        ? AppColor.tertiary50
        : isInsertedCell
            ? AppColor.secondary50
            : AppColor.primary15;
  }

  bool _isSelectedRowOrColumnOrSquare(Point point, SudokuFieldModel value) {
    int currentSquare = value.determineSquare(widget.point);
    int selectedSquare = value.determineSquare(value.currentCell);

    return point.row == value.currentCell.row ||
        point.column == value.currentCell.column ||
        currentSquare == selectedSquare;
  }

  bool _isSelectedNumber(Point point, SudokuFieldModel value) {
    return value.field[point.row][point.column] ==
        value.field[value.currentCell.row][value.currentCell.column] &&
        value.field[value.currentCell.row][value.currentCell.column]
            .isNotEmpty;
  }
}
