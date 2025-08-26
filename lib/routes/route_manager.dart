import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/auth_screen/auth_home_page_screen/auth_homepage.dart';
import 'package:red_tangerine/screen/auth_screen/create_new_password_screen/create_new_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signin_screen/signin_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/verification_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/chat_message_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/matches_screen/matches_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/edit_child_age_screen/edit_child_age_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/edit_profile_screen/edit_profile_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen/setting_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/about_us_screen/about_us_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/blocked_user_screen/blocked_user_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/change_password_screen/change_password_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/faq_screen/faq_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/report_screen/report_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/term_and_condition_screen/term_and_condition_screen.dart';
import 'package:red_tangerine/screen/preference_screen/add_profile_picture_screen/add_profile_picture_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/child_age_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_diagnosis_screen/child_diagnosis_screen.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/let_other_know_about_u_screen.dart';
import 'package:red_tangerine/screen/preference_screen/please_share_your_location_screen/please_share_your_location_screen.dart';
import 'package:red_tangerine/screen/preference_screen/preference_home_screen/preference_home_screen.dart';
import 'package:red_tangerine/screen/preference_screen/therapy_support_child_receive/therapy_support_child_receive.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/what_enjoy_as_parent.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/where_parenting_journey_screen.dart';
import 'package:red_tangerine/screen/preference_screen/your_privacy_matters_screen/your_privacy_matters_screen.dart';
import 'package:red_tangerine/screen/splash_screen/splash_screen.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(name: AppRoutes.authHomePageScreen, page: () => AuthHomepage()),
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
        name: AppRoutes.createNewPasswordScreen,
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
        name: AppRoutes.whatEnjoyAsParentScreen,
        page: () => WhatEnjoyAsParent(),
      ),
      GetPage(
        name: AppRoutes.addProfilePictureScreen,
        page: () => AddProfilePictureScreen(),
      ),
      GetPage(
        name: AppRoutes.letOtherKnowAboutUScreen,
        page: () => LetOtherKnowAboutUScreen(),
      ),
      GetPage(
        name: AppRoutes.pleaseShareYourLocationScreen,
        page: () => PleaseShareYourLocationScreen(),
      ),
      GetPage(
        name: AppRoutes.yourPrivacyMattersScreen,
        page: () => YourPrivacyMattersScreen(),
      ),
      GetPage(
        name: AppRoutes.bottomNavBarScreen,
        page: () => BottomNavBarScreen(),
      ),
      GetPage(
        name: AppRoutes.editProfileScreen,
        page: () => EditProfileScreen(),
      ),
      GetPage(
        name: AppRoutes.editChildAgeScreen,
        page: () => EditChildAgeScreen(),
      ),
      GetPage(
        name: AppRoutes.chatMessageScreen,
        page: () => ChatMessageScreen(),
      ),
      GetPage(name: AppRoutes.settingScreen, page: () => SettingScreen()),
      GetPage(
        name: AppRoutes.changePasswordScreen,
        page: () => ChangePasswordScreen(),
      ),
      GetPage(name: AppRoutes.aboutUsScreen, page: () => AboutUsScreen()),
      GetPage(
        name: AppRoutes.privacyPolicyScreen,
        page: () => PrivacyPolicyScreen(),
      ),
      GetPage(
        name: AppRoutes.termConditionScreen,
        page: () => TermAndConditionScreen(),
      ),
      GetPage(name: AppRoutes.faqScreen, page: () => FaqScreen()),
      GetPage(name: AppRoutes.reportScreen, page: () => ReportScreen()),
      GetPage(
        name: AppRoutes.blockedUserScreen,
        page: () => BlockedUserScreen(),
      ),
    ];
  }
}
