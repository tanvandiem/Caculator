import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_caculator/caculator_provider.dart';
import 'package:my_caculator/color.dart';

import 'package:provider/provider.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  Map<String, bool> buttonStates = {};

  void handleTap(String btntxt) {
    setState(() {
      buttonStates[btntxt] = true;
    });

    Provider.of<CalculatorProvider>(context, listen: false).setValue(btntxt);

    Timer(const Duration(milliseconds: 350), () {
      setState(() {
        buttonStates[btntxt] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context).size.width / 4;
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          provider.displayText,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: linghtb,
                            fontSize: buttonSize / 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  numButton(Colors.white, 'C', linghtb, buttonSize),
                  numButton(Colors.white, '%', linghtb, buttonSize),
                  numButton(Colors.white, '', linghtb, buttonSize),
                  numButton(itemColor, '+', linghtb, buttonSize),
                ],
              ),
              Row(
                children: <Widget>[
                  numButton(itemColor, '7', blackColor, buttonSize),
                  numButton(itemColor, '8', blackColor, buttonSize),
                  numButton(itemColor, '9', blackColor, buttonSize),
                  numButton(itemColor, '-', linghtb, buttonSize),
                ],
              ),
              Row(
                children: <Widget>[
                  numButton(itemColor, '4', blackColor, buttonSize),
                  numButton(itemColor, '5', blackColor, buttonSize),
                  numButton(itemColor, '6', blackColor, buttonSize),
                  numButton(itemColor, 'x', linghtb, buttonSize),
                ],
              ),
              Row(
                children: <Widget>[
                  numButton(itemColor, '1', blackColor, buttonSize),
                  numButton(itemColor, '2', blackColor, buttonSize),
                  numButton(itemColor, '3', blackColor, buttonSize),
                  numButton(itemColor, '/', linghtb, buttonSize),
                ],
              ),
              Row(
                children: <Widget>[
                  numButton(itemColor, '', linghtb, buttonSize),
                  Container(
                    height: buttonSize,
                    width: buttonSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: itemColor,
                      ),
                      onPressed: () => Provider.of<CalculatorProvider>(context,
                              listen: false)
                          .setValue("0"),
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: buttonSize / 3, color: blackColor),
                      ),
                    ),
                  ),
                  numButton(itemColor, '.', blackColor, buttonSize),
                  numButton(linghtb, '=', itemColor, buttonSize),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget numButton(
    Color btncolor,
    String btntxt,
    Color txtcolor,
    double size,
  ) {
    bool isChange = buttonStates[btntxt] ?? false;

    return GestureDetector(
      onTap: () => handleTap(btntxt),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.grey, width: 0.5, style: BorderStyle.solid),
          color: isChange ? const Color.fromARGB(8, 223, 64, 251) : btncolor,
        ),
        child: Center(
          child: Text(
            btntxt,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size / 3,
              color: txtcolor,
            ),
          ),
        ),
      ),
    );
  }
}
