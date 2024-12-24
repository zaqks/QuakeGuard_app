import 'package:earthquake_alarm/global/Text2.dart';
import 'package:flutter/material.dart';

class TextButton2 extends StatefulWidget {
  final String text;
  final Function onPressed;

  const TextButton2({super.key, required this.text, required this.onPressed});

  @override
  State<TextButton2> createState() => _TextButton2State();
}

class _TextButton2State extends State<TextButton2> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          _loading = true;
          setState(() {});
          //
          await widget.onPressed();
          //
          _loading = false;
          setState(() {});
        },
        child: _loading
            ? const CircularProgressIndicator()
            : Text2(
                text: widget.text,
              ));
  }
}
