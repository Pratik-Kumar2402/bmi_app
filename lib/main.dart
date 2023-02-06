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
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bmiresult = "";
  var bgColor1 = Colors.pink.shade900;
  var bgColor2 = Colors.pink.shade500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 5),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: LinearGradient(
              colors: [bgColor1, bgColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    foreground: Paint()..color = Colors.white,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  style: TextStyle(fontSize: 18),
                  controller: weightController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your weight in kgs',
                      style: TextStyle(
                        foreground: Paint()..color = Colors.white,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.line_weight_rounded,
                      color: Colors.white,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  style: TextStyle(fontSize: 18),
                  controller: feetController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your height in feet',
                      style: TextStyle(
                        foreground: Paint()..color = Colors.white,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.white,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  style: TextStyle(fontSize: 18),
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter your height in inches',
                      style: TextStyle(
                        foreground: Paint()..color = Colors.white,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.height_outlined,
                      color: Colors.white,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var weight = weightController.text.toString();
                    var height = feetController.text.toString();
                    var inches = inchController.text.toString();

                    if (weight != "" && height != "" && inches != "") {
                      var iweight = int.parse(weight);
                      var iheight = int.parse(height);
                      var iinches = int.parse(inches);

                      var tinches = (iheight * 12) + iinches;

                      var tcm = tinches * 2.54;
                      var tm = tcm / 100;

                      var bmi = iweight / (tm * tm);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are over-weight";
                        bgColor1 = Colors.red.shade500;
                        bgColor2 = Colors.red.shade900;
                      } else if (bmi < 18) {
                        msg = "You are under-weight";
                        bgColor1 = Colors.orange.shade500;
                        bgColor2 = Colors.deepOrange.shade700;
                      } else {
                        msg = "You are healthy";
                        bgColor1 = Colors.green.shade600;
                        bgColor2 = Colors.green.shade900;
                      }

                      setState(() {
                        bmiresult = "$msg";
                        result = "Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required blanks!";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      foreground: Paint()..color = Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  bmiresult,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    foreground: Paint()..color = Colors.white,
                  ),
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    foreground: Paint()..color = Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
