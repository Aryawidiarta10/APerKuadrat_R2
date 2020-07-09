import 'package:flutter/material.dart';

class Credit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text("Kredit"),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            color:Colors.purple,
            height: 4.0,
          ),
          preferredSize: null
        ),
      ),
      body: Konten()
    );
  }
}

class Konten extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top:20, bottom:5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(fit: BoxFit.fill, image: AssetImage('images/ar.jpg'),),
            ),
          ),
          Text('Sumber:', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w500),),
          Text('Dokumentasi Pribadi', style: TextStyle(color: Colors.blue, fontSize: 9.0),),
          Container(
            child: Text('Sumber Lainnya :', style: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w500),),
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 37, right: 37, top: 5, bottom: 10),
            color: Colors.cyan[100],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:15, left:20),
                padding: EdgeInsets.only(left:10, right:10, top:5, bottom:5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80, width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40), 
                        image: DecorationImage(
                          image: AssetImage('images/solusi.jpg'),
                        ),
                      ),
                    ),
                    Text('Sumber :', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w500),),
                    Text('www.pixabay.com', style: TextStyle(color: Colors.blue, fontSize: 9.0),),
                  ],
                )
              ),

              Container(
                margin: EdgeInsets.only(top:15, left:40),
                padding: EdgeInsets.only(left:10, right:10, top:5, bottom:5),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80, width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40), 
                        image: DecorationImage(
                          image: AssetImage('images/Bingung.jpg'),
                        ),
                      ),
                    ),
                    Text('Sumber :', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w500),),
                    Text('wwww.1.bp.blogspot.com', style: TextStyle(color: Colors.blue, fontSize: 9.0),),
                  ],
                )
              ),
            ]
          ), 
          Container(
            margin: EdgeInsets.only(top:30, left:5),
            padding: EdgeInsets.only(left:39, right:32, top:10, bottom:10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue,
                width: 2,
              )
            ),
            child: Column(
              children: <Widget>[
                Text('Sumber Materi Persamaan Kuadrat:', style: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w500),),
                Text('https://www.studiobelajar.com/persamaan-kuadrat/', style: TextStyle(color: Colors.blue, fontSize: 9.0),),
              ],
            )
          ),
        ],  
      ) 
    );
  }
}