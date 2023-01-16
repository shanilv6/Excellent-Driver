import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config.dart';

class LanguageController extends GetxController {
  var arabicSelection = false.obs;

  var englishSelection = false.obs;

  var japaneseSelection = false.obs;

  var chineseSelection = false.obs;

  languageSetup(bool arabic, bool chinese, bool japanese, bool english) async {
    final arabiSelection = await SharedPreferences.getInstance();
    arabiSelection.setBool(AppConfig.ARABISELECTION, arabic);
    final englishSelection = await SharedPreferences.getInstance();
    englishSelection.setBool(AppConfig.ENGLISHSELECTION, english);
    final japaneseSelection = await SharedPreferences.getInstance();
    japaneseSelection.setBool(AppConfig.JAPANESESELECTION, japanese);
    final chineseSelection = await SharedPreferences.getInstance();
    chineseSelection.setBool(AppConfig.CHINESESELECTION, chinese);


  }
  languageGetter()async{
    final arabiSelection = await SharedPreferences.getInstance();
    final englishSelectionValue = await SharedPreferences.getInstance();
    final japaneseSelectionValue = await SharedPreferences.getInstance();
    final chineseSelectionValue = await SharedPreferences.getInstance();
    final arabiValue = arabiSelection.getBool(AppConfig.ARABISELECTION);
    final englishValue = englishSelectionValue.getBool(AppConfig.ENGLISHSELECTION);
    final japaneseValue = japaneseSelectionValue.getBool(AppConfig.JAPANESESELECTION);
    final chineseValue = chineseSelectionValue.getBool(AppConfig.CHINESESELECTION);
    if(arabiValue == true){
      arabicSelection.value =true;
    }
    if(englishValue == true){
      englishSelection.value =true;
    }
    if(japaneseValue == true){
      japaneseSelection.value =true;
    }
    if(chineseValue == true){
      chineseSelection.value =true;
    }





  }
}