import 'package:earthquake_alarm/global/Text2.dart';
import 'package:earthquake_alarm/style/style.dart';
import 'package:flutter/material.dart';

class TextField2 extends StatefulWidget {
  final TextField2Elem elem;
  final int? lines;

  const TextField2({super.key, required this.elem, this.lines});

  @override
  State<TextField2> createState() => _TextField2State();
}

class _TextField2State extends State<TextField2> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: widget.lines ?? 1,
          controller: widget.elem.ctrl,
          cursorColor: Colors.black, // Set the cursor color to black
          style: const TextStyle(
            fontSize: sz3,
            color: Colors.black,
          ),
          textAlign: TextAlign.start, // Centering the text input
          obscureText: widget.elem.pwd && !_visible,
          decoration: InputDecoration(
            hintText:
                //widget.hint == null ? widget.hint : translate(widget.hint!),

                translate(widget.elem.hint),
            filled: true,
            fillColor: white,
            prefixIcon: Icon(
              widget.elem.icn,
              size: sz5,
              color: accent0,
            ),
            suffixIcon: widget.elem.pwd
                ? (IconButton(
                    icon: Icon(
                        _visible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: sz5),
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    }))
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(sz2), // Rounded edges
              borderSide: BorderSide.none, // Remove border line
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(sz2), // Rounded edges for enabled state
              borderSide: BorderSide.none, // Remove border line
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(sz2), // Rounded edges for focused state
              borderSide: BorderSide.none, // Remove border line
            ),
          ),
        ),
        widget.elem.err == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(sz1),
                child: Text2(
                  text: widget.elem.err!,
                  color: err,
                  fontSize: sz2,
                  align: TextAlign.center,
                ),
              )
      ],
    );
  }
}

class TextField2Elem {
  final String key;
  String hint;
  bool pwd = false;

  final IconData icn;

  final TextEditingController ctrl = TextEditingController();
  String? err;

  TextField2Elem({
    required this.key,
    required this.hint,
    required this.icn,
  }) {
    pwd = hint.contains("password");
  }
}
