import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var ldn = 5; // Left Dice Number!!-- var -> is used to define the variable.
  var rdn = 2; // Right Dice Number!!--
  // var -> it will bw static if type mentioned at first like this is integer
  // but if not mentioned at first it will work as a dynamic variable
  // whose datatype can be changed any time.

  void changeDiceFace() {
    setState(() {
      rdn = Random().nextInt(6) + 1; // The rdn and ldn is present
      // both in the setState because we want to roll both the
      // dice when one of them get pressed.
      ldn = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: [
          Expanded( // This widget is used to avoid the overflow of the
            // asset present inside nd wrap the asset
            // inside a box that will expand till the space
            // it get on the screen.
            child: SizedBox.expand(
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                  // Also read the below details.
                  // setState(() {
                   // ldn = Random().nextInt(6) + 1; // To avoid 0-5 as
                    // Random().nextInt() is providing because nextInt is taking
                    // max number which is 6 and giving us the rang from 0 - max
                    // number - 1 i.e, 6. So we add +1 to avoid the number issue
                    // for 0 and 6
                   // rdn = Random().nextInt(6) + 1;
                  // });
                },
                child: Image.asset('images/dice$ldn.png'), // Dollar($) symbol
                // is used to use the
                // available variables.
              ),
            ),
          ),
          Expanded(
            child: SizedBox.expand(
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$rdn.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
