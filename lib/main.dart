import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;




  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

class _MyHomePageState extends State<MyHomePage> {
  String equation= '0';
  String result = '0';
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

buttonPressed(String buttonText){
  setState(() {
    if(buttonText == "clr"){
      equation = "0";
      result = "0";
      equationFontSize = 38.0;
      resultFontSize = 48.0;
    }


    else if(buttonText == "="){
      equationFontSize = 38.0;
      resultFontSize = 48.0;

      expression = equation;

      try{
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      }catch(e){
        result = "Error";
      }

    }

    else{
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      if(equation == "0"){
        equation = buttonText;
      }else {
        equation = equation + buttonText;
      }
    }
  });

}

  Widget calcButton(String t, Color color) {
      return Container(
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.25,
        width: MediaQuery.of(context).size.width * 0.25,

        child: ElevatedButton(
          child: Text(t),
          style: ButtonStyle(
            backgroundColor:  MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          onPressed:() => buttonPressed(t),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 50, 60, 1),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(25, 50, 60, 1),
      ),
      body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize, color: Colors.white70),),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize, color: Colors.white),),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  calcButton('1', Color.fromRGBO(248, 141, 173,1)),
                  calcButton('2', Color.fromRGBO(248, 141, 173,1)),
                  calcButton('3', Color.fromRGBO(248, 141, 173,1)),
                  calcButton('+', Color.fromRGBO(192, 224, 222, 1)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  calcButton('4', Color.fromRGBO(248, 141, 173,1)),
                  calcButton('5', Color.fromRGBO(248, 141, 173,1)),
                  calcButton('6', Color.fromRGBO(248, 141, 173,1)),
                  calcButton('-', Color.fromRGBO(192, 224, 222, 1)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  calcButton('7',  Color.fromRGBO(248, 141, 173,1)),
                  calcButton('8',  Color.fromRGBO(248, 141, 173,1)),
                  calcButton('9',  Color.fromRGBO(248, 141, 173,1)),
                  calcButton('*',  Color.fromRGBO(192, 224, 222, 1)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  calcButton('=', Color.fromRGBO(131, 144, 250, 1)),
                  calcButton('0',  Color.fromRGBO(248, 141, 173,1)),
                  calcButton('clr', Color.fromRGBO(131, 144, 250, 1)),
                  calcButton('/', Color.fromRGBO(192, 224, 222, 1)),
                ],
              ),
            ],
          ),


        ],
      ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


