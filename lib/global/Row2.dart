import 'package:flutter/widgets.dart';

class Row2 extends StatefulWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> children;
  final double spacing;

  const Row2(
      {super.key,
      required this.children,
      required this.spacing,
      this.crossAxisAlignment,
      this.mainAxisAlignment});

  @override
  State<Row2> createState() => _Row2State();
}

class _Row2State extends State<Row2> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    //insert the first elem with no padding
    if (widget.children.isNotEmpty) children.add(widget.children[0]);

    // all the next ones come with padding
    Widget toAdd;
    for (int _ = 1; _ < widget.children.length; _++) {
      toAdd = widget.children[_] is Expanded
          ? widget.children[_]
          : Padding(
              padding: EdgeInsets.only(left: widget.spacing),
              child: widget.children[_],
            );
      children.add(toAdd);
    }

    return Row(
      mainAxisAlignment: widget.mainAxisAlignment == null
          ? MainAxisAlignment.start
          : widget.mainAxisAlignment!,
      //
      crossAxisAlignment: widget.crossAxisAlignment == null
          ? CrossAxisAlignment.start
          : widget.crossAxisAlignment!,
      //
      children: children,
    );
  }
}
