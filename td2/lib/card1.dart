import 'package:flutter/material.dart';
import 'package:td2_2223/cardMorpion.dart';
import 'package:td2_2223/home.dart';
import 'package:provider/provider.dart';
import 'package:td2_2223/models/settingModel.dart';



class Card1 extends StatefulWidget {
  const Card1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardState createState() => _CardState();
}

class _CardState extends State<Card1> {
  final TextEditingController joueur1Controller = TextEditingController();
  String _pseudo = '';



  @override
  void dispose() {
    joueur1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
            title: Text('Tic Tac Toe'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                },
              ),
          ),
      body:

            Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 TextField(
                    onChanged: (value) {
                                 setState(() {
                                   _pseudo = value;
                                 });
                               },
                   decoration: const InputDecoration(
                       border: OutlineInputBorder(), labelText: "Joueur1"),
                 ),
                 TextButton(
                   onPressed: () {
                         //saveName(joueur1, joueur2);
                     setState(() {
                       context.read<SettingViewModel>().pseudo = _pseudo;
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EcranMorpion()),
                       );
                     });
                   },
                   child: Text('Jouer'),
                 )
               ],
         ),
    );
  }


}