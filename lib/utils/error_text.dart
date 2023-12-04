import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: Text(
        "Something went Wrong,\n Please try again",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      )),
    );
  }
}
