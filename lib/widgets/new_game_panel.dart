import 'package:flutter/material.dart';
import 'package:sudoku/widgets/new_game_button.dart';

import '../model/difficult.dart';

class NewGamePanel extends StatelessWidget {
  const NewGamePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _newGameButton(Difficult.easy),
        _newGameButton(Difficult.normal),
        _newGameButton(Difficult.hard),
      ],
    );
  }

  Widget _newGameButton(difficult) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: NewGameButton(difficult: difficult),
    );
  }
}
