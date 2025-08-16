import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/auth_screen/auth_home_page_screen/auth_homepage.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signin_screen/signin_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/verification_screen.dart';
import 'package:red_tangerine/screen/splash_screen/splash_screen.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(name: AppRoutes.authHomePage, page: () => AuthHomepage()),
      GetPage(name: AppRoutes.signinScreen, page: () => SigninScreen(),),
      GetPage(name: AppRoutes.signupScreen, page: () => SignupScreen(),),
      GetPage(name: AppRoutes.verificationScreen, page: () => VerificationScreen(),),
      GetPage(name: AppRoutes.forgotPasswordScreen, page: () => ForgotPasswordScreen(),)
    ];
  }
}
