import 'package:flutter/material.dart';
import 'package:tugas1_mobile/informasi.dart';


class kalkulator extends StatefulWidget {
  static String tag = 'kalkulator';

  State createState() => kalkulatorState();
}

class kalkulatorState extends State<kalkulator>
    with SingleTickerProviderStateMixin {

  @override
  String output = '0';

  String temp =
      '0'; //psuedo output, we keep this in memory and later assign it as num1, num2, or as decimal value.
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String history = "";

  Widget buildbutton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white70,
          ),
          onPressed: () {
            // whenever the button is pressed the state changes, so we put a setState() function and inside that we put all the changes. so whenever changes happen, widget is rebuilt and change is displayed.
            setState(() {
              if (buttonValue == 'AC') {
                temp = '0';
                num1 = 0;
                num2 = 0;
                operand = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                num1 = double.parse(output);
                operand = buttonValue;
                temp = '0';
              } else if (buttonValue == '.') {
                if (temp.contains('.')) {
                  print(
                      "already contains a decimal"); // if the number already contains a decimal, we print this.
                  return;
                } else {
                  temp = temp +
                      buttonValue; //we are adding a decimal point to the number we have at hand
                }
              } else if (buttonValue == "=") {
                num2 = double.parse(output);

                if (operand == '+') {
                  temp = (num1 + num2).toString();
                } else if (operand == '-') {
                  temp = (num1 - num2).toString();
                } else if (operand == 'x') {
                  temp = (num1 * num2).toString();
                } else if (operand == '/') {
                  temp = (num1 / num2).toString();
                } else if (operand == '%') {
                  temp = (num1 % num2).toString();
                }

                num1 = 0;
                num2 = 0;
                operand = "";
              } else {
                temp = temp + buttonValue;
              }

              print(temp);
              setState(() {
                output = double.parse(temp).toStringAsFixed(
                    2); // temp will contain many zeroes, so we make it into a double and allow only two decimals, then we make it back into string.
              });

//recording history of the operations done
              if(buttonValue!= 'AC'){
                history = history + buttonValue;  // as long as buttonValue is not 'AC', keep displaying them.
              }
              else{
                history = '';                   // if 'AC' is pressed, then delete the history.
              }

            });
          },


//designing the button
          child: Container(
            child: Text(
              buttonValue,
              style: TextStyle(
                  fontSize: 30, color: Colors.blueGrey.shade800),
            ),
            padding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueGrey.shade900,
      body: Container(
          child: Column(
            children: [
              Expanded(
                child: Divider(),
              ),

              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
                child: Text(
                  history,
                  style: TextStyle(
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 85,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: [
                      buildbutton("AC", 2),
                      buildbutton("%", 1),
                      buildbutton("/", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("7", 1),
                      buildbutton("8", 1),
                      buildbutton("9", 1),
                      buildbutton("x", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("4", 1),
                      buildbutton("5", 1),
                      buildbutton("6", 1),
                      buildbutton("-", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("1", 1),
                      buildbutton("2", 1),
                      buildbutton("3", 1),
                      buildbutton("+", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("0", 1),
                      buildbutton(".", 1),
                      buildbutton("=", 2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //main axis the vertical axis in a column so this positions the children at the center of the vertical axis
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //the horizontal axis of a column, again we position the children's at the center of the horizontal axis

                    children: [

                      MaterialButton(
                        minWidth: 200.0,
                        height: 50.0,
                        onPressed: () {
                          Navigator.of(context).pushNamed(informasi.tag);
                        },
                        color: Colors.blueGrey.shade200,
                        child: Text('Kembali', style: TextStyle(color: Colors.black)),
                      ),
                      Padding(padding: EdgeInsets.all(20.0),),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                      ),

                    ],

                  ),

                ],
              ),
            ],

    ),
      ),
    );
  }
}