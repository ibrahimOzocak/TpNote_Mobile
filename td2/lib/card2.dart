import 'package:flutter/material.dart';
import 'package:td2_2223/home.dart';
import 'package:td2_2223/models/settingModel.dart';
import 'package:provider/provider.dart';

class Ecran2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
                title: const Text('Retourner au menu'),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false,
                    );
                  },
                ),
              ),
      body:
        ListView.builder(
          itemCount: context.read<SettingViewModel>().score.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(context.read<SettingViewModel>().score[context.read<SettingViewModel>().score.length - index - 1]),
            );
          },
        ),
    );
  }
}