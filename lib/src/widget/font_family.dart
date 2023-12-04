import 'package:flutter/material.dart';
import 'package:text_editor/src/font_option_model.dart';
import 'package:text_editor/text_editor_data.dart';

class FontFamily extends StatefulWidget {
  final List<FontFamilyModel> fonts;

  FontFamily(this.fonts);

  @override
  _FontFamilyState createState() => _FontFamilyState();
}

class _FontFamilyState extends State<FontFamily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.fonts
              .map((fontModel) =>
                  _FontFamilyPicker(fontModel.font, fontModel.isSelected))
              .toList(),
        ),
      ),
    );
  }
}

class _FontFamilyPicker extends StatelessWidget {
  final String font;
  final bool isSelected;

  _FontFamilyPicker(this.font, this.isSelected);

  @override
  Widget build(BuildContext context) {
    final fontOptionModel = TextEditorData.read(context).fontOptionModel;

    return GestureDetector(
      onTap: () => fontOptionModel.selectFontFamily(font),
      child: Container(
        width: 42,
        height: 28,
        margin: const EdgeInsets.only(right: 16, bottom: 5),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: Colors.white,
                  width: 2,
                )
              : null,
          borderRadius: BorderRadius.circular(100),
          color: const Color(0x332e2e2e),
        ),
        child: Center(
          child: Text(
            'Aa',
            style:
                TextStyle(color: Colors.white, fontFamily: font, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
