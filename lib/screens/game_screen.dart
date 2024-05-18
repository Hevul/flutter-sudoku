import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sudoku/widgets/button_panel.dart';
import 'package:sudoku/widgets/game_field.dart';
import 'package:sudoku/widgets/new_game_panel.dart';
import 'package:sudoku/widgets/tool_panel.dart';

import '../constants/app_colors.dart';
import '../widgets/info_panel.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          Spacer(),
          NewGamePanel(),
          Spacer(),
          InfoPanel(),
          GameField(),
          Spacer(),
          ToolPanel(),
          Spacer(),
          ButtonPanel(),
          Spacer(),
        ],
      ),
    );
  }
}

