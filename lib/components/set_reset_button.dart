import 'package:dinamik_ortalama_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_ortalama_app/pages/ortalama_hesapla.page.dart';

import '../constants/app_constants.dart';

class setResetButton extends StatefulWidget {
  const setResetButton({
    Key? key,
  }) : super(key: key);

  @override
  State<setResetButton> createState() => _setResetButtonState();
}

class _setResetButtonState extends State<setResetButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 413,maxHeight: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            "Ekranı Temizle",
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
    );
  }
}
