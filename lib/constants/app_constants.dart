import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.lightBlue;
  static final TextStyle inputStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w800, color: anaRenk.shade200);
  static const String baslikText = "Ortalama Hesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk.shade200);
  static final TextStyle ortalamaGosterTextStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);
  static final TextStyle standartTextStyle = GoogleFonts.quicksand(
    color: anaRenk,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle subtitleTextStyle = GoogleFonts.quicksand(
    color: anaRenk,
    fontWeight: FontWeight.w800,
  );

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
