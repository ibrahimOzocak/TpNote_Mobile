import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:td2_2223/mytheme.dart';
import 'package:td2_2223/home.dart';

class EcranSettings extends StatefulWidget {
  @override
  State<EcranSettings> createState() => _EcranSettingsState();
}

class _EcranSettingsState extends State<EcranSettings> {
  bool _dark = true;

  void _onToggle(bool value) {
    setState(() {
      _dark = value;
    });
  }

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
    body: Center(
      child: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: MyTheme.dark().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.dark().scaffoldBackgroundColor,
        ),
        lightTheme: SettingsThemeData(
          settingsListBackground: MyTheme.light().scaffoldBackgroundColor,
          settingsSectionBackground: MyTheme.light().scaffoldBackgroundColor,
        ),
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: _dark,
                onToggle: _onToggle,
                title: const Text('Dark mode'),
                leading: const Icon(Icons.invert_colors),
              )
            ],
          )
        ],
      ),
    ));
  }
}

