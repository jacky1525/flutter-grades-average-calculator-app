import 'package:dinamik_ortalama_app/components/ders_listesi.dart';
import 'package:dinamik_ortalama_app/components/harf_dropdown.dart';
import 'package:dinamik_ortalama_app/components/kredi_dropdown.dart';
import 'package:dinamik_ortalama_app/components/ortalama_goster.dart';
import 'package:dinamik_ortalama_app/constants/app_constants.dart';
import 'package:dinamik_ortalama_app/data/data.dart';
import 'package:dinamik_ortalama_app/model/ders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();

  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue.shade900,
        title: Center(
            child: Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        )),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            'assets/svg/bluebackground.jpg',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildForm(),
                  ),
                  Expanded(
                    flex: 1,
                    child: OrtalamaGoster(
                      dersSayisi: ComponentsData.dersler.length,
                      ortalama: ComponentsData.ortalamaHesapla(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: DersListesi(
                  onDismiss: (index) {
                    ComponentsData.dersler.removeAt(index);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue.shade900,
        foregroundColor: Sabitler.anaRenk.shade200,
        onPressed: () {
          setState(() {});
          ComponentsData.dersler.clear();
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: Sabitler.yatayPadding8,
          child: _buildTextFormField(),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPadding8,
                child: HarfDropDownWidget(
                  onHarfSecildi: (harf) {
                    secilenHarfDeger = harf;
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPadding8,
                child: KrediDropDownWidget(
                  onSecilenKredi: (kredi) {
                    secilenKrediDeger = kredi;
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: _verileriGetir,
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Sabitler.anaRenk,
              iconSize: 30,
            )
          ],
        )
      ]),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          girilenDersAdi = newValue!;
        });
      },
      validator: (value) {
        if (value!.length == 0) {
          return "Ders adını giriniz";
        } else {
          return null;
        }
      },
      style: Sabitler.inputStyle,
      decoration: InputDecoration(
        errorStyle: Sabitler.inputStyle,
        labelText: "Ders adını giriniz",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: Sabitler.inputStyle,
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.lightBlue.shade900,
      ),
    );
  }

  void _verileriGetir() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger);
      ComponentsData.dersEkle(eklenecekDers);
      formKey.currentState!.reset();
      setState(() {});
    }
  }
}
