import 'package:calculator_app/button.dart';
import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String input = "";
  String output = "0";
  @override
  Widget build(BuildContext context) {
    print("homepage rebuilt");
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // input output area
          Expanded(
            child: Container(
              width: double.infinity,
            ),
          ),

          // buttons area
          Container(
            padding: const EdgeInsets.all(12),
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input == "" ? "0" : input,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  output,
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Row(
            children: [
              MyButton(
                text: "AC",
                bgColor: operatorColor,
                tColor: orangeColor,
                onPressed: () {
                  setState(() {
                    input = "0";
                    output = "0";
                  });
                },
              ),
              MyButton(
                  text: "<",
                  onPressed: () {
                    setState(() {
                      input = input.substring(0, input.length - 1);
                    });
                  }),
              MyButton(text: "", bgColor: Colors.transparent, onPressed: () {}),
              MyButton(
                  text: "/",
                  bgColor: operatorColor,
                  tColor: orangeColor,
                  onPressed: () {
                    setState(() {
                      input += "/";
                    });
                  }),
            ],
          ),
          Row(
            children: [
              MyButton(
                  text: "7",
                  onPressed: () {
                    setState(() {
                      input += "7";
                    });
                  }),
              MyButton(
                  text: "8",
                  onPressed: () {
                    setState(() {
                      input += "8";
                    });
                  }),
              MyButton(
                  text: "9",
                  onPressed: () {
                    setState(() {
                      input += "9";
                    });
                  }),
              MyButton(
                  text: "x",
                  bgColor: operatorColor,
                  tColor: orangeColor,
                  onPressed: () {
                    setState(() {
                      input += "x";
                    });
                  }),
            ],
          ),
          Row(
            children: [
              MyButton(
                  text: "4",
                  onPressed: () {
                    setState(() {
                      input += "4";
                    });
                  }),
              MyButton(
                  text: "5",
                  onPressed: () {
                    setState(() {
                      input += "5";
                    });
                  }),
              MyButton(
                  text: "6",
                  onPressed: () {
                    setState(() {
                      input += "6";
                    });
                  }),
              MyButton(
                  text: "-",
                  bgColor: operatorColor,
                  tColor: orangeColor,
                  onPressed: () {
                    setState(() {
                      input += "-";
                    });
                  }),
            ],
          ),
          Row(
            children: [
              MyButton(
                  text: "1",
                  onPressed: () {
                    setState(() {
                      input += "1";
                    });
                  }),
              MyButton(
                  text: "2",
                  onPressed: () {
                    setState(() {
                      input += "2";
                    });
                  }),
              MyButton(
                  text: "3",
                  onPressed: () {
                    setState(() {
                      input += "3";
                    });
                  }),
              MyButton(
                  text: "+",
                  bgColor: operatorColor,
                  tColor: orangeColor,
                  onPressed: () {
                    setState(() {
                      input += "+";
                    });
                  }),
            ],
          ),
          Row(
            children: [
              MyButton(
                  text: "%",
                  bgColor: operatorColor,
                  tColor: orangeColor,
                  onPressed: () {
                    setState(() {
                      input += "%";
                    });
                  }),
              MyButton(
                  text: "0",
                  onPressed: () {
                    setState(() {
                      input += "0";
                    });
                  }),
              MyButton(
                  text: ".",
                  onPressed: () {
                    setState(() {
                      input += ".";
                    });
                  }),
              MyButton(
                text: "=",
                bgColor: orangeColor,
                onPressed: () {
                  setState(() {
                    output = evaluateInput(input);
                    input = output;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String evaluateInput(String input) {
    String output = "0";
    input = input.replaceAll("x", "*");
    try {
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel cm = ContextModel();

      return exp.evaluate(EvaluationType.REAL, cm).toString();
    } catch (e) {
      print(e.toString());
      String errorMessage = e.toString();
      if (errorMessage.contains("Invalid value")) {
        errorMessage = "Invalid Input";
      } else {}
      final snackBar = SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: operatorColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            errorMessage,
            style: const TextStyle(
              fontSize: 18,
              color: orangeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        duration: const Duration(milliseconds: 1000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return output;
  }
}
