import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sudoku/model/difficult.dart';
import 'package:sudoku/model/point.dart';

import '../utils/sudoku_generator.dart';

class SudokuFieldModel extends ChangeNotifier {
  Point _currentCell;
  int _mistakes;
  Difficult _difficult;
  late SudokuGenerator _generator;
  final List<Point> _invalidCells;
  final List<Point> _insertedCells;

  Difficult get difficult => _difficult;
  int get mistakes => _mistakes;
  Point get currentCell => _currentCell;
  List<List<String>> get field => _generator.field;

  set currentCell(Point value) {
    _currentCell = value;
    notifyListeners();
  }

  SudokuFieldModel()
      : _invalidCells = [],
        _insertedCells = [],
        _mistakes = 0,
        _currentCell = Point(0, 0),
        _difficult = Difficult.hard {
    _generator = SudokuGenerator(_difficult.percent);
    _generator.fillValues();
  }

  void setNumberInCell(String number) {
    if (field[_currentCell.row][_currentCell.column].isNotEmpty) {
      return;
    }

    field[_currentCell.row][_currentCell.column] = number;
    _insertedCells.add(_currentCell);

    if (_isInvalidCell(_currentCell)) {
      _invalidCells.add(_currentCell);
      _mistakes++;
    }

    if (_mistakes == 3) {
      newGame(difficult);
    }

    notifyListeners();
  }

  int determineSquare(Point point) {
    if (point.column == -1 || point.row == -1) {
      return -1;
    }

    const int squareSize = 3;

    int row = point.row ~/ squareSize;
    int column = point.column ~/ squareSize;

    return row * squareSize + column;
  }

  void newGame(Difficult diff) {
    _difficult = diff;
    _generator = SudokuGenerator(_difficult.percent);
    _generator.fillValues();
    _invalidCells.clear();
    _insertedCells.clear();
    _mistakes = 0;
    notifyListeners();
  }

  void removeCell() {
    if (isInvalidCell(_currentCell)) {
      field[_currentCell.row][_currentCell.column] = '';
      _invalidCells.remove(_currentCell);
      notifyListeners();
    }
  }

  void getTip() {
    if (field[_currentCell.row][_currentCell.column].isEmpty) {
      field[_currentCell.row][_currentCell.column] =
          _generator.completedField[_currentCell.row][_currentCell.column];
      notifyListeners();
    }
  }

  bool _isInvalidCell(Point point) {
    return field[_currentCell.row][_currentCell.column] !=
        _generator.completedField[_currentCell.row][_currentCell.column];
  }

  bool isInvalidCell(Point point) {
    return _invalidCells.contains(point);
  }

  bool isInsertedCell(Point point) {
    return _insertedCells.contains(point);
  }

  bool isCompletedNumber(String number) {
    int count = 0;

    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (field[i][j] == number) {
          count++;
        }
      }
    }

    return count == 9;
  }
}
