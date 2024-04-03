import 'package:flutter/material.dart';
import 'dart:math';

class EcranMorpion extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<EcranMorpion> {
  var _board;
  var _currentPlayer;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List<String>.filled(9, '');
    _currentPlayer = 'X';
  }

  void _onTileClicked(int index) {
    if (_board[index] == '') {
      setState(() {
        _board[index] = _currentPlayer;
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
        if (_checkWinner() != "false") {
          _showWinnerDialog();

        }
        else{
          jouerBot();

        }

      });

    }

  }
  void jouerBot(){
    setState(() {
      Random random = Random();
      List<int> indices = [];
      for (int i = 0; i < _board.length; i++) {
        if (_board[i] == '') {
          indices.add(i);
        }
      }
      int ind = random.nextInt(indices.length);

      _board[indices[ind]] = _currentPlayer;
      _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';

      if (_checkWinner() != "false") {
        _showWinnerDialog();

      }
    });
  }

  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Partie terminÃ©e"),
          content: Text("Le joueur " +
              (_currentPlayer == 'X' ? 'O' : 'X') +
              " a gagnÃ© !"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _initializeBoard();
              },
              child: Text("Nouvelle partie"),
            ),
          ],
        );
      },
    );
  }

  String _checkWinner() {
    // VÃ©rification des lignes
    for (int i = 0; i < 3; i++) {
      if (_board[i * 3] != '' &&
          _board[i * 3] == _board[i * 3 + 1] &&
          _board[i * 3 + 1] == _board[i * 3 + 2]) {
        return _board[i * 3] + " Winner";
      }
    }

    // VÃ©rification des colonnes
    for (int i = 0; i < 3; i++) {
      if (_board[i] != '' &&
          _board[i] == _board[i + 3] &&
          _board[i + 3] == _board[i + 6]) {
        return _board[i] + " Winner";
      }
    }

    // VÃ©rification des diagonales
    if (_board[0] != '' && _board[0] == _board[4] && _board[4] == _board[8]) {
      return _board[4] + " Winner";
    }
    if (_board[2] != '' && _board[2] == _board[4] && _board[4] == _board[6]) {
      return _board[4] + " Winner";
    }

    return "false";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _board.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onTileClicked(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Text(
                  _board[index],
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
