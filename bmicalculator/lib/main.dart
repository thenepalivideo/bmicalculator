import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  double bmi = 0;
  String message = "BMI Value";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black12,
                  width: double.infinity,
                  height: 150,
                  child: Text("BMI Calculator"),
                ),
                Container(
                    child: Form(
                        child: Column(
                  children: [
                    TextFormField(
                      controller: height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "height",
                        helperText: "Your height in meter",
                        hintText: "meter",
                      ),
                    ),
                    TextFormField(
                      controller: weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Weight",
                        helperText: "Your Weight",
                        hintText: "KG",
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          double sqheight = double.parse(height.text) *
                              double.parse(height.text);
                          int bmi =
                              (double.parse(weight.text) / sqheight).round();
                          if (bmi <= 18) {
                            setState(() {
                              message = "Under Weight ";
                            });
                          } else if (bmi <= 25) {
                            setState(() {
                              message = "Normal Weight ";
                            });
                          } else if (bmi <= 30) {
                            setState(() {
                              message = "Over Weight ";
                            });
                          } else if (bmi <= 35) {
                            setState(() {
                              message = "Extermly Obese Weight ";
                            });
                          } else {
                            setState(() {
                              message = "Extermly Over Weight";
                            });
                          }
                          ;
                        },
                        child: Text("Submit")),
                  ],
                ))),
                Text(message)
              ]),
        ),
      ),
    );
  }
}
