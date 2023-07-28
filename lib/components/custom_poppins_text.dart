import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPoppinsText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow textOverflow;

  const CustomPoppinsText({
    required this.text,
    this.fontSize = 24,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.textOverflow = TextOverflow.visible,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      overflow: textOverflow,
    );
  }
}
