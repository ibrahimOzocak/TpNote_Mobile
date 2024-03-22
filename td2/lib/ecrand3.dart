import 'package:flutter/material.dart';
import 'package:td2/mytheme.dart';
import 'package:google_fonts/google_fonts.dart';

class ecrand3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return Text(
      'Ecrand 3 !',
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.red,
          color: Colors.blue,
        ),
      ),
    );
  }
}