// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int cindex = 0;
  String result = "";
  double height = 0;
  String youare = "";
  var youareColor = Colors.white;
  double weight = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 27, 27, 27),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    ratioButton("Woman", Colors.red, 0),
                    ratioButton("Men", Colors.blue, 1),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Your Height in Cm: ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: 'Your Height in Cm',
                    filled: true,
                    fillColor: Color.fromARGB(255, 44, 44, 44),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Your Weight in Kg: ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: 'Your Weight in Kg',
                    filled: true,
                    fillColor: Color.fromARGB(255, 44, 44, 44),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Your BMI is: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'You Are: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    youare,
                    style: TextStyle(
                        fontSize: 40,
                        color: youareColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });
                      calculateBmi(height, weight);
                    },
                    // color: Colors.blue,
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalresult = (weight / (height * height)) * 10000;
    String bmi = finalresult.toStringAsFixed(2);
    if (finalresult < 18.5) {
      youare = 'Underweight';
      youareColor = Colors.blue;
    } else if (finalresult <= 24.9 && finalresult > 18.6) {
      youare = "Normal";
      youareColor = Colors.green;
    } else if (finalresult > 24.9 && finalresult < 29.9) {
      youare = "Overweight";
      youareColor = Colors.yellow;
    } else if (finalresult > 29.9 && finalresult < 34.9) {
      youare = "Obese";
      youareColor = Colors.red;
    } else if (finalresult > 35) {
      youare = "Extremely Obese";
      youareColor = Color.fromARGB(255, 190, 43, 33);
    }
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      cindex = index;
    });
  }

  Widget ratioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.0),
          border: Border.all(
            width: 2,
            color: cindex == index ? color : Color.fromARGB(255, 32, 32, 32),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: TextButton(
          // color: Color.fromARGB(255, 44, 44, 44),

          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          onPressed: () {
            changeIndex(index);
          },
          child: Icon(
            value == 'Men' ? Icons.male : Icons.female,
            color: color,
            size: 60,
          ),
          // child: Text(
          //   value,
          //   style: TextStyle(
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //     color: cindex == index ? Colors.white : color,
          //   ),
          // ),
        ),
      ),
    );
  }
}
