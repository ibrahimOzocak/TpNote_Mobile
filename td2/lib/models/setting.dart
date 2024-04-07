import 'package:shared_preferences/shared_preferences.dart';



class SettingRepository{
  // ignore: constant_identifier_names
  static const PSEUDO_KEY = "pseudo";
  // ignore: constant_identifier_names
  static const SCORE_KEY = "score";

  saveSettingsPseudo(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PSEUDO_KEY, value);
  }

  saveSettingsScore(String pseudo, String score) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> scores = sharedPreferences.getStringList(SCORE_KEY) ?? [];
    scores.add("$pseudo : $score");
    sharedPreferences.setStringList(SCORE_KEY, scores);
  }




  Future<List<String>> getSettingsScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(SCORE_KEY) ?? [];
  }

  Future<String?> getSettingsPseudo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(PSEUDO_KEY);
  }



  clearSettingsScore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(SCORE_KEY);
  }
  clearSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
