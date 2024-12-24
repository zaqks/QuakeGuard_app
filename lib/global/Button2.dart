import 'package:earthquake_alarm/style/style.dart';
import 'package:flutter/material.dart';

class Button2 extends StatefulWidget {
  final Widget child;
  final Function func;
  //final Color? clr;
  final bool? invert;

  const Button2({
    super.key,
    required this.child,
    required this.func,
    this.invert,
  });

  @override
  State<Button2> createState() => _Button2State();
}

class _Button2State extends State<Button2> {
  bool ldng = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.invert == true ? accent0 : null,
            padding: const EdgeInsets.all(sz4),
            shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(sz0)
                //,
                borderRadius: BorderRadius.circular(sz2))),
        onPressed: () async {
          if (!ldng) {
            setState(() {
              ldng = true;
            });

            try {
              await widget.func();
            } catch (e) {
              print(e);
            }

            setState(() {
              ldng = false;
            });
          }
        },
        child: ldng
            ? SizedBox(
                width: sz4,
                height: sz4,
                child: CircularProgressIndicator(
                  color: widget.invert == true ? white : accent0,
                  strokeWidth: sz1 / 2,
                ))
            : widget.child);
  }
}
