import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'Calculator')
    );
  }
}

class MyHomePage extends StatefulWidget{

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  String output = "";
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  buttonPressed(String buttonText) {
    if(buttonText == "CLEAR") {
      _output = "";
      output = "";
      num1 = 0;
      num2 = 0;
    } else if(buttonText == "+" ||
      buttonText == "-"||
      buttonText == "*" ||
      buttonText == "/"
    ) {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
      output = "";
    } else if (buttonText == ".") {
      if(_output.contains(".")) {
        print("Already contains a decimal");
      } else {
        _output = _output + buttonText;
      }
    } else if(buttonText == "=") {
      num2 = double.parse(output);
      if(operand == "+" ) {
        _output = (num1 + num2).toString();
      }

      if(operand == "-" ) {
        _output = (num1 - num2).toString();
      }


      if(operand == "*" ) {
        _output = (num1 * num2).toString();
      }

      if(operand == "/" ) {
        _output = (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = "";

    } else {
      _output = _output + buttonText;
    }
    
    print(output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(child: SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: OutlinedButton(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: Divider(),),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                )
              ],
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("*"),
                  ],
                )
              ],
            ),

            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                )
              ],
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                )
              ],
            ),
            new Column(
              children: [
                new Row(
                  children: [
                    buildButton("CLEAR"),
                    buildButton("="),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

