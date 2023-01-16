import 'package:edriver/presentation/screens/booking_conformation_screen/booking_conformation_screen.dart';
import 'package:edriver/presentation/screens/booking_error_screen/booking_error_screen.dart';
import 'package:edriver/presentation/screens/booknow_screen/booknow_screen.dart';
import 'package:edriver/presentation/screens/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:edriver/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:edriver/presentation/screens/forgotpassword_otp_screen/forgotpassword_otp_screen.dart';
import 'package:edriver/presentation/screens/forgotpassword_screen/forgotpassword_screen.dart';
import 'package:edriver/presentation/screens/forgotpassword_setpassword_screen/forgotpassword_setpassword_screen.dart';
import 'package:edriver/presentation/screens/history_screen/history_screen.dart';
import 'package:edriver/presentation/screens/home_screen/home_screen.dart';
import 'package:edriver/presentation/screens/language_screen/language_screen.dart';
import 'package:edriver/presentation/screens/login_screen/login_screen.dart';
import 'package:edriver/presentation/screens/profile_screen/profile_screen.dart';
import 'package:edriver/presentation/screens/signup_screen/signup_screen.dart';
import 'package:edriver/presentation/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Routes {
  static final pages = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/LanguageScreen',
      page: () => LanguageScreen(
        onPressed: () {
          Get.toNamed('/SignupScreen');
          languageSetup();
        },
      ),
    ),
    GetPage(name: '/SignupScreen', page: () => SignupScreen()),
    GetPage(name: '/LoginScreen', page: () => LoginScreen()),
    GetPage(name: '/HomeScreen', page: () => HomeScreen()),
    GetPage(name: '/ForgotPasswordScreen', page: () => ForgotPasswordScreen()),
    GetPage(
        name: '/ForgotPasswordOtpScreen',
        page: () => ForgotPasswordOtpScreen()),
    GetPage(
        name: '/ForgotPasswordSetPasswordScreen',
        page: () => ForgotPasswordSetPasswordScreen()),
    GetPage(name: '/BottomNavigationBar', page: () => BottomNavigationBar()),
    GetPage(name: '/BookNowScreen', page: () => BookNowScreen()),
    GetPage(
        name: '/BookingConformationScreen',
        page: () => BookingConformationScreen()),
    GetPage(name: '/BookingErrorScreen', page: () => BookingErrorScreen()),
    GetPage(name: '/EditProfleScreen', page: () => EditProfleScreen()),
    GetPage(name: '/ProfileScreen', page: () => ProfileScreen()),
    GetPage(
        name: '/SelectLanguageScreen',
        page: () => LanguageScreen(onPressed: () {
              Get.back();
            })),
    GetPage(
      name: '/HistoryScreen',
      page: () => HistoryScreen(),
    ),
  ];
}
