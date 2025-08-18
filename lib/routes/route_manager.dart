import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/auth_screen/auth_home_page_screen/auth_homepage.dart';
import 'package:red_tangerine/screen/auth_screen/create_new_password_screen/create_new_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signin_screen/signin_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/verification_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/child_age_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_diagnosis_screen/child_diagnosis_screen.dart';
import 'package:red_tangerine/screen/preference_screen/preference_home_screen/preference_home_screen.dart';
import 'package:red_tangerine/screen/preference_screen/therapy_support_child_receive/therapy_support_child_receive.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/what_enjoy_as_parent.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/where_parenting_journey_screen.dart';
import 'package:red_tangerine/screen/splash_screen/splash_screen.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(name: AppRoutes.authHomePage, page: () => AuthHomepage()),
      GetPage(name: AppRoutes.signinScreen, page: () => SigninScreen()),
      GetPage(name: AppRoutes.signupScreen, page: () => SignupScreen()),
      GetPage(
        name: AppRoutes.verificationScreen,
        page: () => VerificationScreen(),
      ),
      GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
      ),
      GetPage(
        name: AppRoutes.createNewPassword,
        page: () => CreateNewPasswordScreen(),
      ),
      GetPage(
        name: AppRoutes.preferenceHomeScreen,
        page: () => PreferenceHomeScreen(),
      ),
      GetPage(name: AppRoutes.childAgeScreen, page: () => ChildAgeScreen()),
      GetPage(
        name: AppRoutes.childDiagnosisScreen,
        page: () => ChildDiagnosisScreen(),
      ),
      GetPage(
        name: AppRoutes.therapySupportChildReceiveScreen,
        page: () => TherapySupportChildReceive(),
      ),
      GetPage(
        name: AppRoutes.whereParentingJourneyScreen,
        page: () => WhereParentingJourneyScreen(),
      ),
      GetPage(
        name: AppRoutes.whatEnjoyAsParent,
        page: () => WhatEnjoyAsParent(),
      ),
    ];
  }
}
