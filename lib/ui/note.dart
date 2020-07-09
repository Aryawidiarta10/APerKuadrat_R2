import 'package:flutter/material.dart';
import 'package:aperkuadrat_rev/ui/entryForm.dart';
import 'package:aperkuadrat_rev/models/catatan.dart';
import 'package:aperkuadrat_rev/helpers/hdatabases.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Note extends StatefulWidget {
  @override
  NoteState createState() => NoteState();
}

class NoteState extends State<Note> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Catatan> catatanList;

  @override
  Widget build(BuildContext context) {
    if (catatanList == null) {
      catatanList = List<Catatan>();
    }

    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text('Catatan'),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var catatan = await navigateToEntryForm(context, null);
          if (catatan != null) addCatatan(catatan);
        },
      ),
    );
  }

  Future<Catatan> navigateToEntryForm(BuildContext context, Catatan catatan) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return EntryForm(catatan);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blue[200],
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.note, color: Colors.green[800]),
            ),
            title: Text('y : '+this.catatanList[index].persamaan, style: textStyle,),
            subtitle: Text('x₁ = '+this.catatanList[index].akar1 + ' | x₂ = ' + this.catatanList[index].akar2),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.red,),
              onTap: () {
                deleteCatatan(catatanList[index]);
              },
            ),
            onTap: () async {
              var catatan = await navigateToEntryForm(context, this.catatanList[index]);
              if (catatan != null) editCatatan(catatan);
            },
          ),
        );
      },
    );
  }
  
  void addCatatan(Catatan object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }
  
  void editCatatan(Catatan object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }
  
  void deleteCatatan(Catatan object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }
  
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Catatan>> catatanListFuture = dbHelper.getCatatanList();
      catatanListFuture.then((catatanList) {
        setState(() {
          this.catatanList = catatanList;
          this.count = catatanList.length;
        });
      });
    });
  }
}