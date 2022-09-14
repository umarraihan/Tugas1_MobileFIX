import 'package:flutter/material.dart';
import 'package:tugas1_mobile/kalkulator.dart';
import 'package:tugas1_mobile/login.dart';

class informasi extends StatefulWidget {
  static String tag = 'informasi';

  State createState() => informasiState();
}

class informasiState extends State<informasi>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    //Scaffold is structure to define app bar and stuff
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("img/background.jpg",
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            //mainAxisAlignment means vertical
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("img/logo2.png", width:200),
              Text(
                  "Anggota Kelompok",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold
                  )
              ),
              Padding(padding: EdgeInsets.all(20.0),),
              Text(
                "Augys Dellea Rischa Aisyah 124200037 \n Dyah Ayu Zubaedah 124200040 \n Umar Raihan Baluwel 124200040",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w300
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  Navigator.of(context).pushNamed(login.tag);
                },
                color: Colors.blueGrey.shade200,
                child: Text('Kembali', style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  Navigator.of(context).pushNamed(kalkulator.tag);
                },
                color: Colors.blueGrey.shade200,
                child: Text('Kalkulator', style: TextStyle(color: Colors.black)),
              ),
            ],

          ),
        ],
      ),
    );
  }
}