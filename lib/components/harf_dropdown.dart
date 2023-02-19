import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/data.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade900,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        dropdownColor: Colors.lightBlue.shade900,
        value: secilenHarfDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (value) {
          setState(() {
            secilenHarfDeger = value!;
            widget.onHarfSecildi(value);
          });
        },
        underline: Container(),
        items: ComponentsData.dropDownDersHarfleri(),
      ),
    );
  }
}
