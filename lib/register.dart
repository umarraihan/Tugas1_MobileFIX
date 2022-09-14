import 'package:flutter/material.dart';
import 'package:tugas1_mobile/informasi.dart';
import 'package:tugas1_mobile/login.dart';



class register extends StatefulWidget {
  static String tag = 'register';
  @override
  State createState() => registerState();
}

class registerState extends State<register>
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
              Form(

                  child: Theme(
                    data: ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                            TextStyle(color: Colors.teal, fontSize: 20.0))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: "Masukan Username"),
                            keyboardType: TextInputType.text,
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: "Masukan Email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: "Masukan Nama Lengkap"),
                            keyboardType: TextInputType.text,
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: "Masukan Password"),
                            keyboardType: TextInputType.text,
                            obscureText: true,
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
                            color: Colors.blueGrey.shade300,
                            child: Text('Register', style: TextStyle(color: Colors.black)),
                          ),


                        ],
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
