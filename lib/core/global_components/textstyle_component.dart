// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponents extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight? weight;
  final Color? color;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  TextComponents({
    super.key,
    required this.title,
    required this.size,
    this.weight,
    this.color,
    this.decoration,
    this.overflow,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        fontSize: size,
        color: color,
        fontWeight: weight,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
