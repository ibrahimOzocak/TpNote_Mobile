import 'setting.dart';
import 'package:flutter/material.dart';

class SettingViewModel extends ChangeNotifier {
  late String _pseudo;
  late List _score;
  late SettingRepository _settingRepository;
  String get pseudos => _pseudo;
  List get score => _score;
  SettingViewModel() {
    _score = [];
    _settingRepository = SettingRepository();
    getSettingsPseudo();
    getSettingsScore();
  }


  set pseudo(String value) {
    _pseudo = value;
    _settingRepository.saveSettingsPseudo(value);
    notifyListeners();
  }

  addScore(String pseudo, String score) {
    if(pseudo == ""){
        pseudo = "Joueur";
    }
    _score.add("$pseudo:$score");
    _settingRepository.saveSettingsScore(pseudo, score);
    notifyListeners();
  }

  clearScore() {
    _score = [];
    _settingRepository.clearSettingsScore();
    notifyListeners();
  }

  getSettingsPseudo() async {
    _pseudo = await _settingRepository.getSettingsPseudo() ?? "";
    notifyListeners();
  }

  getSettingsScore() async {
    _score = await _settingRepository.getSettingsScore();
    notifyListeners();
  }

  clearSettings() {
    _settingRepository.clearSettings();
    _pseudo = "";
    _score = [];
    notifyListeners();
  }

  clearSettingsScore() {
    _settingRepository.clearSettingsScore();
    _score = [];
    notifyListeners();
  }
}
