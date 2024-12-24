import 'package:flutter/widgets.dart';

class Column2 extends StatefulWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> children;
  final double spacing;

  const Column2(
      {super.key,
      required this.children,
      required this.spacing,
      this.crossAxisAlignment,
      this.mainAxisAlignment});

  @override
  State<Column2> createState() => _Column2State();
}

class _Column2State extends State<Column2> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    //insert the first elem with no padding
    if (widget.children.isNotEmpty) children.add(widget.children[0]);

    // all the next ones come with padding
    for (int _ = 1; _ < widget.children.length; _++) {
      children.add(Padding(
        padding: EdgeInsets.only(top: widget.spacing),
        child: widget.children[_],
      ));
    }

    return Column(
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
