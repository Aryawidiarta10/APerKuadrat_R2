import 'package:flutter/material.dart';
import 'package:aperkuadrat_rev/models/catatan.dart';

class EntryForm extends StatefulWidget {
  final Catatan catatan;
  EntryForm(this.catatan);
  @override
  EntryFormState createState() => EntryFormState(this.catatan);
}

class EntryFormState extends State<EntryForm> {
  Catatan catatan;
  EntryFormState(this.catatan);
  TextEditingController persamaanController = TextEditingController();
  TextEditingController akar1Controller = TextEditingController();
  TextEditingController akar2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (catatan != null) {
      persamaanController.text = catatan.persamaan;
      akar1Controller.text = catatan.akar1;
      akar2Controller.text = catatan.akar2;
    }

    return Scaffold(
       backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          title: catatan == null ? Text('Tambah') : Text('Edit'),
          centerTitle: true,
          bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: persamaanController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Persamaan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: akar1Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Akar 1',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: akar2Controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Akar 2',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:10.0, bottom:10.0),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Simpan',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (catatan == null) {
                            catatan = Catatan(persamaanController.text, akar1Controller.text, akar2Controller.text);
                          } else {
                            catatan.persamaan = persamaanController.text;
                            catatan.akar1 = akar1Controller.text;
                            catatan.akar2= akar2Controller.text;
                          }
                          Navigator.pop(context, catatan);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}