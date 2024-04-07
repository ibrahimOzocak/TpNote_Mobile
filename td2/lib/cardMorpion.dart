import 'package:flutter/material.dart';
import 'dart:math';
import 'package:td2_2223/card1.dart';
import 'package:td2_2223/models/settingModel.dart';
import 'package:provider/provider.dart';
class EcranMorpion extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<EcranMorpion> {
  var _board;
  var _currentPlayer;
  int _index = 0;
  bool partieFini = false;

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
  if(!partieFini){
      if (_board[index] == '') {
            setState(() {
              _board[index] = _currentPlayer;
              _currentPlayer = _currentPlayer == 'X' ? 'BOT' : 'X';
              if (_checkWinner() != "false") {
                  partieFini = true;
                _showWinnerDialog();
              }
              else{
                jouerBot();
              }
            });
          }
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
      int ind = 0;
      if(indices.length == 0 ){
        partieFini = true;
        _showEqualDialog();
        return;
      }else{
        ind = random.nextInt(indices.length);
      }
      _board[indices[ind]] = _currentPlayer;
      _currentPlayer = _currentPlayer == 'X' ? 'BOT' : 'X';

      if (_checkWinner() != "false") {
        partieFini = true;
        _showWinnerDialog();
      }

    });
  }

  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Partie terminé"),
          content: Text("Le joueur " +
              (_currentPlayer == 'X' ? 'BOT' : 'X') +
              " a gagné !"),
        );
      },
    );

  }
  void _showEqualDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Partie terminé"),
            content: Text("égalité"),
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
  void _restartGame(int ind){
      if(ind == 0){
        Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => EcranMorpion()),
             (route) => false,
          );
      }
      else{
        if(partieFini){
            if(_checkWinner() == "false"){
                context.read<SettingViewModel>().addScore(
                    context.read<SettingViewModel>().pseudos,
                    "égalité"
                );
            }
            else{
                context.read<SettingViewModel>().addScore(
                    context.read<SettingViewModel>().pseudos,
                    _currentPlayer == 'BOT' ? "Gagné" : "Perdue"
                );
            }
        }
      }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "joueur : " + context.read<SettingViewModel>().pseudos),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Card1()),
                );
            },
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.grey,
              unselectedItemColor: Colors.grey,
              currentIndex: _index,
              onTap: _restartGame,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'Nouvelle partie',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'Sauvegarder les scores',
                ),

              ],
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
