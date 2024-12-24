
import 'package:earthquake_alarm/global/Column2.dart';
import 'package:earthquake_alarm/style/style.dart';
import 'package:flutter/material.dart';
class Section extends StatefulWidget {
  final List<Widget>? sectionTitle;

  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  //
  //final MainAxisAlignment? mainAxisAlignment0;
  final CrossAxisAlignment? crossAxisAlignment0;
  //
  final List<Widget> sectionContent;
  //
  const Section({
    super.key,
    this.sectionTitle,
    required this.sectionContent,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    //

    //this.mainAxisAlignment0,
    this.crossAxisAlignment0,
  });

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column2(
        spacing: sz2,
        children: (widget.sectionTitle == null
                ? <Widget>[]
                : <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: widget.crossAxisAlignment0 == null
                          ? CrossAxisAlignment.start
                          : widget.crossAxisAlignment0!,
                      children: [
                        for (int _ = 0; _ < widget.sectionTitle!.length; _++)
                          _ == 0
                              ? Expanded(child: widget.sectionTitle![_])
                              : widget.sectionTitle![_]
                      ],
                    )
                  ]) +
            <Widget>[
              SizedBox(
                  width: double.infinity,
                  child: Column2(
                      spacing: sz1,
                      mainAxisAlignment: widget.mainAxisAlignment,
                      crossAxisAlignment: widget.crossAxisAlignment,
                      children: widget.sectionContent))
            ],
      ),
    );
  }
}
