import 'package:flutter/material.dart';


class Card1 extends StatefulWidget {
  const Card1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardState createState() => _CardState();
}

class _CardState extends State<Card1> {
  bool _showPlayButton = true;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Morpion',
            style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          _showPlayButton ? TextButton(
            onPressed: () {
              setState(() {
                _showPlayButton = false;
              });
            },
            child: Text('Jouer'),
          )
              : const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Joueur1"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Joueur1"
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}