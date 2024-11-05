import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final _audioPlayer = AudioPlayer();
  var diceNum = 1;
  bool isRolling = false;

  void rollDice() async {
    // If dice is already rolling, do nothing
    if (isRolling) return;

    setState(() {
      isRolling = true;
    });

    // Start playing audio
    await _audioPlayer.play(AssetSource('audios/dice-142528.mp3'));

    // Start dice rolling animation for a specific duration
    const rollDuration = Duration(seconds: 1); // Set how long you want the dice to "roll"
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        diceNum = randomizer.nextInt(6) + 1;
      });

      if (timer.tick * 100 >= rollDuration.inMilliseconds) {
        timer.cancel();
        setState(() {
          isRolling = false;
          diceNum = randomizer.nextInt(6) + 1; // Final dice number after animation
        });
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceNum.png',
          width: 200,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 25),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
