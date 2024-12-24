import 'package:earthquake_alarm/style/style.dart';
import 'package:flutter/widgets.dart';

class Text2 extends StatefulWidget {
  final String text;

  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  final bool? wrapper;

  final TextAlign? align;
  final int? maxLines;

  const Text2(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.wrapper,
      this.align,
      this.maxLines});

  @override
  State<Text2> createState() => _Text2State();
}

class _Text2State extends State<Text2> {
  @override
  Widget build(BuildContext context) {
    //addWord(widget.text);

    return Text(
      widget.wrapper == false ? widget.text : translate(widget.text),
      maxLines: widget.maxLines,
      overflow: widget.maxLines == null ? null : TextOverflow.ellipsis,
      textAlign: widget.align,
      style: TextStyle(
        color: widget.color ?? txt0,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        fontFamily: 'ZonaPro',
      ),
    );
  }
}

String translate(String input) {
  List<String> words = input.split(' ');
  //
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).toList();
  //

  //addWord(input);

  return capitalizedWords.join(' ');
}

// const String _missingPath =
//     "/home/zak/Desktop/myDesk/flutterProjects/AMIDI_APP/lib/data/lang.json";
// void addWord(String word) {
//   File file = File(_missingPath);
//   List<String> jsonData =
//       List<String>.from(jsonDecode(file.readAsStringSync()));
//   //

//   word = word.toLowerCase();

//   if (!jsonData.contains(word)) jsonData.add(word);

//   file.writeAsStringSync(jsonEncode(jsonData));
// }
