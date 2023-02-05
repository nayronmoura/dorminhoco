import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const ButtonWidget({Key? key, this.text, this.onPressed, required this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled? onPressed: null,
      child: Text(
        text ?? '',
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
      );
  }
}
