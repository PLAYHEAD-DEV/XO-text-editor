import 'package:flutter/material.dart';
import 'package:text_editor/text_editor_data.dart';

class ColorPalette extends StatefulWidget {
  final List<Color> colors;

  ColorPalette(this.colors);

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    final textStyleModel = TextEditorData.of(context).textStyleModel;
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...widget.colors.map((color) => _ColorPicker(color)).toList(),
          ],
        ),
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  final Color color;

  _ColorPicker(this.color);

  @override
  Widget build(BuildContext context) {
    final textStyleModel = TextEditorData.read(context).textStyleModel;

    return GestureDetector(
      onTap: () => textStyleModel.editTextColor(color),
      child: Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.only(right: 24, bottom: 12),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
