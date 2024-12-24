import 'package:flutter/material.dart';

class Grid2 extends StatefulWidget {
  final int columns;
  final List<Widget> children;
  final double spacing;

  const Grid2({
    super.key,
    required this.columns,
    required this.children,
    required this.spacing,
  });

  @override
  State<Grid2> createState() => _Grid2State();
}

class _Grid2State extends State<Grid2> {
  List<List<Widget>> _buildColumns(
      int columnsNum, List<Widget> children, double spacing) {
    List<List<Widget>> columns = List.generate(columnsNum, (_) => []);
    int currentColumn = 0;

    for (var child in children) {
      columns[currentColumn].add(Padding(
        padding: EdgeInsets.only(
            right: currentColumn == columnsNum - 1 ? 0 : spacing,
            bottom: spacing),
        child: child,
      ));
      currentColumn = (currentColumn + 1) % columnsNum;
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        List<List<Widget>> columns =
            _buildColumns(widget.columns, widget.children, widget.spacing);

        return SizedBox(
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columns.map((column) {
              return SizedBox(
                width: width / widget.columns,
                child: Column(children: column),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
