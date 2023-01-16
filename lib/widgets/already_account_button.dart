import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/utils/size_utils.dart';
import '../core/utils/style.dart';

class AlreadyAccountButton extends StatelessWidget {
  final texts;
  final buttonText;
  final onPressed;

  const AlreadyAccountButton({Key? key,required this.texts,required this.buttonText, this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        left: 65,

      ),
      child: Row(
        children: [
          Text(
            texts,
            style: Textstyles.loginIndicationStyle,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
             buttonText,
              style: Textstyles.loginIndicationStyleNew,
            ),
          ),
        ],
      ),
    );
  }
}
