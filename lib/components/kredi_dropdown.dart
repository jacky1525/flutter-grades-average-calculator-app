import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/data.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onSecilenKredi;
  const KrediDropDownWidget({super.key, required this.onSecilenKredi});

  @override
  State<KrediDropDownWidget> createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  double? secilenKrediDeger;
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
        value: secilenKrediDeger,
        hint: Text(
          "Kredi",
          style: Sabitler.inputStyle,
        ),
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (value) {
          setState(() {
            secilenKrediDeger = value!;
            widget.onSecilenKredi(secilenKrediDeger);
          });
        },
        underline: Container(),
        items: ComponentsData.dropDownKredi(),
      ),
    );
  }
}
