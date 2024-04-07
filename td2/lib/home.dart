import 'package:flutter/material.dart';
import 'package:td2_2223/EcranSettings.dart';
import 'package:td2_2223/card1.dart';
import 'package:td2_2223/card2.dart';
import 'package:td2_2223/card3.dart';
import 'package:td2_2223/cardMorpion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:td2_2223/models/settingModel.dart';
import 'package:provider/provider.dart';



class Home extends StatefulWidget {
  const Home({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> vues = <Widget>[
    Card1(),
    Ecran2(),
    Ecran3(),
    EcranSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
        if(index == 0){
            Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Home()),
            );
        }
        if(index == 1){
             Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Ecran2()),
             );
        }
        if(index == 2){
             Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Ecran3()),
             );
        }
        if(index == 3){
            Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => EcranSettings()),
            );
        }
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Morpion',
              style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Card1()),
                  );
                });
              },
              child: Text('Jouer'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Card1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Card2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Card3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}