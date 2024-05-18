import 'dart:math';

class SudokuGenerator {
  late List<List<String>> _field;
  late List<List<String>> _completedField;
  final int N = 9;
  final int SRN = 3;
  late final int K;

  SudokuGenerator(double percent) {
    K = (percent * N * N).floor();
    _field = List.generate(N, (index) => List.filled(N, ''));
    _completedField = List.generate(N, (index) => List.filled(N, ''));
  }

  List<List<String>> get field => _field;

  List<List<String>> get completedField => _completedField;

  List<List<String>> getCompletedField() {
    return completedField;
  }

  void fillValues() {
    _fillDiagonal();
    _fillRemaining(0, SRN);
    _removeKDigits();
  }

  void _fillDiagonal() {
    for (int i = 0; i < N; i += SRN) {
      _fillBox(i, i);
    }
  }

  bool _unUsedInBox(int rowStart, int colStart, String num) {
    for (int i = 0; i < SRN; i++) {
      for (int j = 0; j < SRN; j++) {
        if (field[rowStart + i][colStart + j] == num) {
          return false;
        }
      }
    }
    return true;
  }

  void _fillBox(int row, int col) {
    String num = '0';
    for (int i = 0; i < SRN; i++) {
      for (int j = 0; j < SRN; j++) {
        while (true) {
          num = '${_randomGenerator(N)}';
          if (_unUsedInBox(row, col, num)) {
            break;
          }
        }
        field[row + i][col + j] = num;
        completedField[row + i][col + j] = num;
      }
    }
  }

  int _randomGenerator(int num) {
    return Random().nextInt(num) + 1;
  }

  bool _checkIfSafe(int i, int j, String num) {
    return (_unUsedInRow(i, num) &&
        _unUsedInCol(j, num) &&
        _unUsedInBox(i - (i % SRN), j - (j % SRN), num));
  }

  bool _unUsedInRow(int i, String num) {
    for (int j = 0; j < N; j++) {
      if (field[i][j] == num) {
        return false;
      }
    }
    return true;
  }

  bool _unUsedInCol(int j, String num) {
    for (int i = 0; i < N; i++) {
      if (field[i][j] == num) {
        return false;
      }
    }
    return true;
  }

  // A recursive function to fill remaining matrix
  bool _fillRemaining(int i, int j) {
    // Check if we have reached the end of the matrix
    if (i == N - 1 && j == N) {
      return true;
    }

    // Move to the next row if we have reached the end of the current row
    if (j == N) {
      i += 1;
      j = 0;
    }

    // Skip cells that are already filled
    if (field[i][j] != '') {
      return _fillRemaining(i, j + 1);
    }

    // Try filling the current cell with a valid value
    for (int num = 1; num <= N; num++) {
      if (_checkIfSafe(i, j, '$num')) {
        field[i][j] = '$num';
        completedField[i][j] = '$num';
        if (_fillRemaining(i, j + 1)) {
          return true;
        }
        field[i][j] = '';
        completedField[i][j] = '';
      }
    }

    // No valid value was found, so backtrack
    return false;
  }

  // Remove the K no. of digits to complete game
  void _removeKDigits() {
    int count = K;

    while (count != 0) {
      // extract coordinates i and j
      int i = Random().nextInt(N);
      int j = Random().nextInt(N);
      if (field[i][j] != '') {
        count--;
        field[i][j] = '';
      }
    }
  }
}
