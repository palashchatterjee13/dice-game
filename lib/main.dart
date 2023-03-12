import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Game by Palash Chatterjee",
      debugShowCheckedModeBanner: false,
      home: DiceApp(),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int diceNumber = 1;

  void changeDiceFace() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double percent = 40;
    double s =
        (width < height) ? width * (percent / 100) : height * (percent / 100);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: s,
                  width: s,
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image(
                      color: Colors.blue,
                      image: AssetImage('faces/dice$diceNumber.png'),
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              bottom: 10,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Developed by Palash Chatterjee\n using Flutter",
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
