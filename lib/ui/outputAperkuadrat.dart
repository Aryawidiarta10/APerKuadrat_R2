import 'package:flutter/material.dart';
import 'dart:math';

class OutputAPK extends StatelessWidget {

  OutputAPK({@required this.vara, @required this.varb, @required this.varc});
  final int vara;
  final int varb;
  final int varc;

  @override
  Widget build(BuildContext context) {
    int det = pow(varb,2)-(4*vara*varc);
    double x1;
    double x2;
    String tx1;
    String tx2;
    String ja;
    String sa;

    if (det<0){
      x1 = -1*varb/2;
      x2 = sqrt((-1*det))/(2*vara);
      tx1="$x1 + $x2 i";
      tx2="$x1 - $x2 i";
      ja="Akar Bilangan Imajiner"; 
      sa="Tidak dapat ditentukan sifatnya";
    }else{
      x1 = (-1*varb + sqrt(det))/(2*vara);
      x2 = (-1*varb - sqrt(det))/(2*vara);
      tx1="$x1";
      tx2="$x2";
      ja="Akar Bilangan Rasional"; 
      sa="Akar-akarnya bertanda sama";
    }
      
    String pk;
    if (varb>=0 && varc>=0)  pk="$vara.x² + $varb.x + $varc = 0";
    else if (varb<0 && varc>=0)  pk="$vara.x² $varb.x + $varc = 0";
    else if (varb>=0 && varc<0)  pk="$vara.x² + $varb.x $varc = 0";
    else  pk="$vara.x² $varb.x $varc = 0";

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hasil'),
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple[500],
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),
      body: Center(
        child:Container(
          child:Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5, left: 100, right: 100),
                color: Colors.amber[100],
                child: Container(
                  height: 115, width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), 
                    image: DecorationImage(
                      image: AssetImage('images/solusi.jpg'),
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(2),
                color: Colors.blue[500],
              ),

              Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(left:10, right: 10, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.cyan[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('Hasil APK', style: TextStyle(color: Colors.black, fontSize: 17.0,fontWeight: FontWeight.w500),),
                      padding: EdgeInsets.only(left:70, right: 70),
                      decoration: BoxDecoration(
                      color: Colors.green[500],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      )
                    ),
                    ),
                    Text(
                      "Persamaan Kuadrat",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,),
                    ),
                    Text(
                      "$pk",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.green[500]),
                    ),
                    Text(
                      "Determinan (D)",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "$det", textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.green[500]),
                    ),
                    Text(
                      "Akar Pertama (x₁)", 
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "$tx1", textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.green[500]),
                    ),
                    Text(
                      "Akar Kedua (x₂)", 
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "$tx2", textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.green[500]),
                    ),
                    Text(
                      "Jenis Akar", 
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "$ja", textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.green[500]),
                    ),
                    Text(
                      "Sifat Akar", 
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "$sa", textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800,color: Colors.green[500]),
                    ),
                  ],
                ) 
              ),
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        width: double.infinity,
        height: 40,
        child: RaisedButton(
          color: Colors.black,
          child: Text('Back',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}