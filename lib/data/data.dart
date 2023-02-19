import 'package:dinamik_ortalama_app/components/ortalama_goster.dart';
import 'package:dinamik_ortalama_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../model/ders.dart';

class ComponentsData {
  static List<Ders> dersler = [];

  static dersEkle(Ders ders) {
    dersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    dersler.forEach((element) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi = toplamKredi + element.krediDegeri;
    });

    return toplamNot / toplamKredi;
  }

  static List<String> _harfNotlari() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> dropDownDersHarfleri() {
    return _harfNotlari()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e,
              style: Sabitler.inputStyle,
            ),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _krediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> dropDownKredi() {
    return _krediler()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
              style: Sabitler.inputStyle
            ),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
