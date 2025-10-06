import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/screen/auth_screen/auth_home_page_screen/auth_homepage.dart';
import 'package:red_tangerine/screen/auth_screen/create_new_password_screen/create_new_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:red_tangerine/screen/auth_screen/login_screen/login_screen.dart';
import 'package:red_tangerine/screen/auth_screen/signup_screen/signup_screen.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/verification_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/bottom_nav_bar_screen/botton_navbar.dart';
import 'package:red_tangerine/screen/main_layout_screens/chats_screen/chat_message_screen/chat_message_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/notification_screen/notification_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/edit_profile_screen/edit_profile_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen/setting_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/about_us_screen/about_us_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/blocked_user_screen/blocked_user_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/change_password_screen/change_password_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/delete_account_screen/delete_account_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/faq_screen/faq_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/report_screen/report_screen.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/term_and_condition_screen/term_and_condition_screen.dart';
import 'package:red_tangerine/screen/preference_screen/add_profile_picture_screen/add_profile_picture_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_age_screen/child_age_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_diagnosis_screen/child_diagnosis_screen.dart';
import 'package:red_tangerine/screen/preference_screen/child_journey_screen/child_journey_screen.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/let_other_know_about_u_screen.dart';
import 'package:red_tangerine/screen/preference_screen/matter_parenting_screen/matter_parenting_screen.dart';
import 'package:red_tangerine/screen/preference_screen/please_share_your_location_screen/please_share_your_location_screen.dart';
import 'package:red_tangerine/screen/preference_screen/preference_home_screen/preference_home_screen.dart';
import 'package:red_tangerine/screen/preference_screen/support_difference_screen/support_difference_screen.dart';
import 'package:red_tangerine/screen/preference_screen/therapy_support_child_receive/therapy_support_child_receive.dart';
import 'package:red_tangerine/screen/preference_screen/turn_on_notification_screen/turn_on_notification_screen.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/what_enjoy_as_parent.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_screen/what_enjoy_screen.dart';
import 'package:red_tangerine/screen/preference_screen/where_parenting_journey_screen/where_parenting_journey_screen.dart';
import 'package:red_tangerine/screen/preference_screen/your_first_name_screen/your_first_name_screen.dart';
import 'package:red_tangerine/screen/preference_screen/your_privacy_matters_screen/your_privacy_matters_screen.dart';
import 'package:red_tangerine/screen/splash_screen/splash_screen.dart';
import 'package:red_tangerine/widgets/custom_transition_widget.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;

  static GetPage customPage({
    required String name,
    required Widget page,
    Transition? transition,
  }) {
    return GetPage(
      name: name,
      page: () => page,
      customTransition: transition == null ? CustomTransitionWidget() : null,
      transition: transition,
      transitionDuration: Duration(milliseconds: 700),
    );
  }

  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(name: AppRoutes.authHomePageScreen, page: () => AuthHomepage()),
      customPage(name: AppRoutes.loginScreen, page: LoginScreen()),
      customPage(
        name: AppRoutes.signupScreen,
        page: SignupScreen(),

        // transition: Transition.size,
      ),
      customPage(
        name: AppRoutes.verificationScreen,
        page: VerificationScreen(),
      ),
      customPage(
        name: AppRoutes.forgotPasswordScreen,
        page: ForgotPasswordScreen(),
      ),
      customPage(
        name: AppRoutes.createNewPasswordScreen,
        page: CreateNewPasswordScreen(),
      ),
      customPage(
        name: AppRoutes.preferenceHomeScreen,
        page: PreferenceHomeScreen(),
      ),
      customPage(name: AppRoutes.childAgeScreen, page: ChildAgeScreen()),
      customPage(
        name: AppRoutes.childDiagnosisScreen,
        page: ChildDiagnosisScreen(),
      ),
      customPage(
        name: AppRoutes.therapySupportChildReceiveScreen,
        page: TherapySupportChildReceive(),
      ),
      customPage(
        name: AppRoutes.whereParentingJourneyScreen,
        page: WhereParentingJourneyScreen(),
      ),
      customPage(
        name: AppRoutes.whatEnjoyAsParentScreen,
        page: WhatEnjoyAsParent(),
      ),
      customPage(
        name: AppRoutes.addProfilePictureScreen,
        page: AddProfilePictureScreen(),
      ),
      customPage(
        name: AppRoutes.letOtherKnowAboutUScreen,
        page: LetOtherKnowAboutUScreen(),
      ),
      customPage(
        name: AppRoutes.pleaseShareYourLocationScreen,
        page: PleaseShareYourLocationScreen(),
      ),
      customPage(
        name: AppRoutes.yourPrivacyMattersScreen,
        page: YourPrivacyMattersScreen(),
      ),
      customPage(
        name: AppRoutes.bottomNavBarScreen,
        page: BottomNavbar(),
        transition: Transition.size,
      ),
      customPage(name: AppRoutes.editProfileScreen, page: EditProfileScreen()),
      customPage(name: AppRoutes.chatMessageScreen, page: ChatMessageScreen()),
      customPage(name: AppRoutes.settingScreen, page: SettingScreen()),
      customPage(
        name: AppRoutes.changePasswordScreen,
        page: ChangePasswordScreen(),
      ),
      customPage(name: AppRoutes.aboutUsScreen, page: AboutUsScreen()),
      customPage(
        name: AppRoutes.privacyPolicyScreen,
        page: PrivacyPolicyScreen(),
      ),
      customPage(
        name: AppRoutes.termConditionScreen,
        page: TermAndConditionScreen(),
      ),
      customPage(name: AppRoutes.faqScreen, page: FaqScreen()),
      customPage(name: AppRoutes.reportScreen, page: ReportScreen()),
      customPage(name: AppRoutes.blockedUserScreen, page: BlockedUserScreen()),
      customPage(
        name: AppRoutes.deleteAccountScreen,
        page: DeleteAccountScreen(),
      ),
      customPage(
        name: AppRoutes.notificationScreen,
        page: NotificationScreen(),

        // customTransition: CustomTransitionWidget(),
      ),
      customPage(
        name: AppRoutes.childJourneyScreen,
        page: ChildJourneyScreen(),
      ),
      customPage(
        name: AppRoutes.supportDifferenceScreen,
        page: SupportDifferenceScreen(),
      ),
      customPage(name: AppRoutes.whatEnjoyScreen, page: WhatEnjoyScreen()),
      customPage(
        name: AppRoutes.matterParentingScreen,
        page: MatterParentingScreen(),
      ),
      customPage(
        name: AppRoutes.turnOnNotificationScreen,
        page: TurnOnNotificationScreen(),
      ),
      customPage(
        name: AppRoutes.yourFirstNameScreen,
        page: YourFirstNameScreen(),
      ),
    ];
  }
}
