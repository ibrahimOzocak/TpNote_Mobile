import 'package:flutter/material.dart';
import 'package:td2_2223/cardMorpion.dart';
import 'package:td2_2223/home.dart';

class Card1 extends StatefulWidget {
  const Card1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardState createState() => _CardState();
}

class _CardState extends State<Card1> {
  bool _showPlayButton = true;
  bool _showMorpionScreen = false;
  final TextEditingController joueur1Controller = TextEditingController();
  final TextEditingController joueur2Controller = TextEditingController();



  @override
  void dispose() {
    joueur1Controller.dispose();
    joueur2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _showMorpionScreen ? EcranMorpion() : _buildInitialScreen(),
    );
  }

  Widget _buildInitialScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Morpion',
          style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        _showPlayButton
            ? TextButton(
          onPressed: () {
            setState(() {
              _showPlayButton = false;
            });
          },
          child: Text('Jouer'),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: joueur1Controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Joueur1"),
            ),
            TextField(
              controller: joueur2Controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Joueur2"),
            ),
            TextButton(
              onPressed: () {
                String joueur1 = joueur1Controller.text;
                String joueur2 = joueur2Controller.text;
                //saveName(joueur1, joueur2);
                setState(() {
                  _showMorpionScreen = true;
                });
              },
              child: Text('Jouer'),
            )
          ],
        ),
      ],
    );
  }
}