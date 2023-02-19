import 'package:dinamik_ortalama_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster(
      {super.key, required this.ortalama, required this.dersSayisi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _dersSayisiGoster(),
          style: Sabitler.ortalamaGosterTextStyle,
        ),
        Text(
          _ortalamaGoster(),
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterTextStyle,
        ),
      ],
    );
  }

  _dersSayisiGoster() {
    if (dersSayisi > 0) {
      return "$dersSayisi Ders Girildi";
    } else {
      return "Ders Seçiniz";
    }
  }

  _ortalamaGoster() {
    if (ortalama > 0) {
      return "${ortalama.toStringAsFixed(2)}";
    } else {
      return "0.0";
    }
  }
}
