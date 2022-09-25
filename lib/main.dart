import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int same = 1;
  void Change (){
    setState(() {
      leftDiceNumber = Random().nextInt(6)+1;
      rightDiceNumber = Random().nextInt(6)+1;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //flex: 2,
            child: TextButton(
              onPressed: () {
                Change();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: TextButton(
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
              onPressed: () {
                Change();
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      same = Random().nextInt(6)+1;
                      leftDiceNumber = same;
                      rightDiceNumber = same;
                    });
                  },
                  child: Text('same face'),
              ),
            ],
          )
        ],
      ),
    );
    
  }
}




// expanded class grows to fill available space in the main axis
//in the case of multiple children, available space is divided amongst them
//flex property allow you to specify how much spaces each expanded should take
//by default every expanded widget get's its flex set to 1
