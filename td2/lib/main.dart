import 'package:flutter/material.dart';
import 'package:td2_2223/home.dart';
import 'package:td2_2223/mytheme.dart';
import 'package:td2_2223/models/settingModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyTD2());
}

class MyTD2 extends StatelessWidget {
  const MyTD2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          SettingViewModel settingViewModel = SettingViewModel();
          return settingViewModel;
        }),
      ],
      child: Consumer<SettingViewModel>(
        builder: (context, SettingViewModel notifier, child) {
          return MaterialApp(
              theme: MyTheme.dark() ,
              title: 'TP MOBILE',
              home: const Home());
        },
      ),
    );
  }
}
