import 'package:flutter/material.dart';
import 'package:sudoku/constants/app_colors.dart';

import 'number_button.dart';

class ButtonPanel extends StatelessWidget {
  const ButtonPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.background),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button('1'),
              spacer(),
              button('2'),
              spacer(),
              button('3'),
              spacer(),
              button('4'),
              spacer(),
              button('5'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button('6'),
                spacer(),
                button('7'),
                spacer(),
                button('8'),
                spacer(),
                button('9'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget spacer() {
    return const SizedBox(width: 15);
  }

  Widget button(String number) {
    return NumberButton(number: number);
  }
}
