import 'package:flutter/material.dart';
import 'dart:math';

class SayisalLoto extends StatefulWidget {
  @override
  _SayisalLotoState createState() => _SayisalLotoState();
}

class _SayisalLotoState extends State<SayisalLoto> {
  List<int> selectedNumbers = List.generate(6, (index) => 0);
  int balance = 0;

  List<int> generateRandomNumbers() {
    var rng = new Random();
    List<int> numbers = List.generate(6, (index) => rng.nextInt(49) + 1);
    return numbers;
  }

  int calculateBalance(List<int> selectedNumbers, List<int> winningNumbers) {
    int correctGuesses = 0;
    for (int i = 0; i < selectedNumbers.length; i++) {
      if (winningNumbers.contains(selectedNumbers[i])) {
        correctGuesses++;
      }
    }
    if (correctGuesses == 1) {
      return balance + 5;
    } else if (correctGuesses == 2) {
      return balance + 10;
    } else if (correctGuesses == 3) {
      return balance + 15;
    } else if (correctGuesses == 4) {
      return balance + 20;
    } else {
      return balance;
    }
  }

  void playLoto() {
    List<int> winningNumbers = generateRandomNumbers();
    balance = calculateBalance(selectedNumbers, winningNumbers);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sayısal Loto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildNumberTextField(0),
                      buildNumberTextField(1),
                      buildNumberTextField(2),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildNumberTextField(3),
                      buildNumberTextField(4),
                      buildNumberTextField(5),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: playLoto,
                    child: Text('Sayısal Loto Oyna'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text('Bakiyeniz: $balance TL', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }

  Widget buildNumberTextField(int index) {
    return SizedBox(
      width: 60.0,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder()),
        onChanged: (value) {
          selectedNumbers[index] = int.tryParse(value) ?? 0;
        },
      ),
    );
  }
}
