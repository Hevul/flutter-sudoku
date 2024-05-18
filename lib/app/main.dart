import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/sudoku_field_model.dart';
import 'package:sudoku/screens/game_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SudokuFieldModel(),
    child: const SudokuApp(),
  ));
}

class SudokuApp extends StatelessWidget {
  const SudokuApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
      home: GameScreen(),
    );
  }
}
