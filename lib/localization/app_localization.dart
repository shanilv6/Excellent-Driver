import 'package:get/get.dart';
import 'en_us/en_us_translations.dart';
import 'ar_ae/ar_ae_translations.dart';
import 'ja_JP/ja_jp_translations.dart';
import 'zh_cn/zh_cn_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'ar_AE': arAe,
    'zh_CN': zhCN ,
    'ja_JP': jaJP ,
  };
}
