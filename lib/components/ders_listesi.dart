import 'package:dinamik_ortalama_app/components/set_reset_button.dart';
import 'package:dinamik_ortalama_app/constants/app_constants.dart';
import 'package:dinamik_ortalama_app/data/data.dart';
import 'package:dinamik_ortalama_app/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;

  const DersListesi({
    super.key,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    List<Ders> derslerBuilder = ComponentsData.dersler;
    return derslerBuilder.length > 0
        ? ListView.builder(
            itemCount: derslerBuilder.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: Sabitler.borderRadius,
                      side: BorderSide(
                          color: Colors.lightBlue.shade900, width: 2),
                    ),
                    child: ListTile(
                      title: Text(
                        derslerBuilder[index].ad,
                        style: Sabitler.inputStyle,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue.shade900,
                        child: Text(
                          (derslerBuilder[index].harfDegeri *
                                  derslerBuilder[index].krediDegeri)
                              .toStringAsFixed(0),
                          style: TextStyle(color: Sabitler.anaRenk.shade200),
                        ),
                      ),
                      subtitle: Text(
                        "${derslerBuilder[index].krediDegeri} Kredi, Not Değeri : ${derslerBuilder[index].harfDegeri}",
                        style: Sabitler.inputStyle,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyin",
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
