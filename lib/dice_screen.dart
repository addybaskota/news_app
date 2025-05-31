import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
 const  DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
     final  List<String> diceImage =[
  "assets/images/photo_2025-04-12_19-52-27.jpg",
       "assets/images/photo_2025-04-12_19-52-30.jpg",
       "assets/images/photo_2025-04-12_19-52-32.jpg",
       "assets/images/photo_2025-04-12_19-52-34.jpg",
       "assets/images/photo_2025-04-12_19-52-36.jpg",
       "assets/images/photo_2025-04-12_19-52-37.jpg",
];

  String diceImagee = "assets/images/photo_2025-04-12_19-52-27.jpg";
  void rollDice(){
    setState(() {
      diceImagee = diceImage[Random().nextInt(6)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DiceScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Image(
            image: AssetImage(diceImagee),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          MaterialButton(
            onPressed: rollDice,
            color: Colors.red,
            child: Text("roll"),
          ),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Scaffold() ));
              },
              color: Colors.red,
                child: Text("Navigate"),
              )
        ]),
      ),
    );
  }
}
