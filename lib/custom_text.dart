import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {

  const CustomText(this.text, this.size, this.color,{super.key});

final String text;
final double size;
final Color color;

  @override
  Widget build(context){
    return  Text(text,
            style: GoogleFonts.lato
            (
            fontSize: size,
            fontWeight: FontWeight.bold,
            color:color
             ),
            );
  }
}