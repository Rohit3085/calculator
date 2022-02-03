import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      color: Colors.teal,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int? firstnum;
  int? secondnum;
  String? texttodisplay;
  String? res;
  String? operationtoperform;

  void btclicked(String? btstring){
      if(btstring == "C"){
        texttodisplay = "";
        firstnum = 0;
        secondnum = 0;
        res = "";
        operationtoperform = "";
      }
      else if(btstring == "+" || btstring == "-" || btstring == "X"|| btstring == "/"){
        firstnum = int.parse(texttodisplay!);
        res = "";
        operationtoperform = btstring;
      }
      else if(btstring == "="){
        secondnum = int.parse(texttodisplay!);
        if(operationtoperform == "+"){
          res = (firstnum! + secondnum!).toString();
        }
        if(operationtoperform == "-"){
          res = (firstnum! - secondnum!).toString();
        }
        if(operationtoperform == "X"){
          res = (firstnum! * secondnum!).toString();
        }
        if(operationtoperform == "/"){
          res = (firstnum! / secondnum!).toString();
        }
      }
      else{
        res = int.parse(texttodisplay! + btstring!).toString();
      }
      setState(() {
        texttodisplay = res;
      });
  }


  Widget customButton(String btval){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: MaterialButton(
          //padding: EdgeInsets.all(25.0),
          onPressed: () => btclicked( btval),
          child: Text(
            "$btval",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "calculator"
        )
      ),
      backgroundColor: Colors.teal,
      body:
      Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "$texttodisplay",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
              ),
            ),
            Row(
              children: <Widget>[
                  customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("X"),

              ],
            ),
            Row(
              children: <Widget>[
                customButton('C'),
                customButton("0"),
                customButton("="),
                customButton("/"),

              ],
            ),
          ],
        ),
      ),
    );
  }
}


