import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  final String hint;
  final String action;
  final void Function()? onTap;
  const CustomTextSpan({super.key, required this.hint, required this.action, this.onTap});

  @override
  Widget build(BuildContext context) {
    return
         RichText(
          text: TextSpan(

            children: [
              TextSpan(
                text: hint,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(text: ' '),
              TextSpan(
                text: action,
                style: Theme.of(context).textTheme.titleMedium,
                recognizer: TapGestureRecognizer()
                  ..onTap = onTap
              ),
            ],
          ),
        );


  }
}
