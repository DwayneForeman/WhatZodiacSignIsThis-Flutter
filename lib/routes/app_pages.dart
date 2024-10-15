import 'package:get/get.dart';
import 'package:whatsignisthis/screens/account/account_profile_bindings.dart';
import 'package:whatsignisthis/screens/account/account_profile_view.dart';
import 'package:whatsignisthis/screens/account/photo/profile_photo_bindings.dart';
import 'package:whatsignisthis/screens/account/photo/profile_photo_view.dart';
import 'package:whatsignisthis/screens/gameover/game_over_bindings.dart';
import 'package:whatsignisthis/screens/gameover/game_over_view.dart';
import 'package:whatsignisthis/screens/home_view.dart';
import 'package:whatsignisthis/screens/intro/intro_bindings.dart';
import 'package:whatsignisthis/screens/intro/intro_view.dart';
import 'package:whatsignisthis/screens/leaderboard/leader_board_bindings.dart';
import 'package:whatsignisthis/screens/leaderboard/leader_board_view.dart';
import 'package:whatsignisthis/screens/login/login_bindings.dart';
import 'package:whatsignisthis/screens/login/login_view.dart';
import 'package:whatsignisthis/screens/login/otp/otp_bindings.dart';
import 'package:whatsignisthis/screens/login/otp/otp_verification_view.dart';
import 'package:whatsignisthis/screens/menu/about/about_us_view.dart';
import 'package:whatsignisthis/screens/menu/contact/contact_us_bindings.dart';
import 'package:whatsignisthis/screens/menu/contact/contact_us_view.dart';
import 'package:whatsignisthis/screens/menu/howtoplay/how_to_play_view.dart';
import 'package:whatsignisthis/screens/menu/notification/notification_setting_bindings.dart';
import 'package:whatsignisthis/screens/menu/notification/notification_settings_view.dart';
import 'package:whatsignisthis/screens/menu/rateus/rate_us_view.dart';
import 'package:whatsignisthis/screens/menu/whoarewe/who_are_we_view.dart';
import 'package:whatsignisthis/screens/play/game_play_bindings.dart';
import 'package:whatsignisthis/screens/play/game_play_view.dart';
import 'package:whatsignisthis/screens/play/level/level_select_bindings.dart';
import 'package:whatsignisthis/screens/play/level/level_select_view.dart';
import 'package:whatsignisthis/screens/upgrade/upgrade_bindings.dart';
import 'package:whatsignisthis/screens/upgrade/upgrade_view.dart';
import 'package:whatsignisthis/screens/user/user_home_bindings.dart';
import 'package:whatsignisthis/screens/user/user_home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.ROOT;

  static final routes = [
    GetPage(name: Routes.INTRO, page: () => const IntroView(), binding: IntroBindings()),
    GetPage(name: Routes.LOGIN, page: () => const LoginView(), binding: LoginBindings()),
    GetPage(name: Routes.OTP, page: () => const OTPView(), binding: OTPBindings()),
    GetPage(name: Routes.ROOT, page: () => const HomeView()),
    GetPage(name: Routes.USER_HOME, page: () => const UserHomeView(), binding: UserHomeBindings()),
    GetPage(name: Routes.LEADER_BORD, page: () => const LeaderBoardView(), binding: LeaderBoardBindings()),
    GetPage(name: Routes.ACCOUNT_PROFILE, page: () => const AccountProfileView(), binding: AccountProfileBindings()),
    GetPage(name: Routes.LEVEL_SELECT, page: () => const LevelSelectView(), binding: LevelSelectBindings()),
    GetPage(name: Routes.UPGRADE, page: () => const UpgradeView(), binding: UpgradeBindings()),
    GetPage(name: Routes.ABOUT, page: () => const AboutUsView()),
    GetPage(name: Routes.WHO_ARE_WE, page: () => const WhoAreWeView()),
    GetPage(name: Routes.HOW_TO_PLAY, page: () => const HowToPlayView()),
    GetPage(name: Routes.CONTACT_US, page: () => const ContactUsView(), binding: ContactUsBindings()),
    GetPage(name: Routes.RATE_US, page: () => const RateUsView()),
    GetPage(name: Routes.PROFILE_PHOTO, page: () => const ProfilePhotoView(), binding: ProfilePhotoBindings()),
    GetPage(name: Routes.NOTIFICATION_SETTINGS, page: () => const NotificationSettingView(), binding: NotificationSettingBindings()),
    GetPage(name: Routes.GAME_PLAY, page: () => const GamePlayView(), binding: GamePlayBindings()),
    GetPage(name: Routes.GAME_OVER, page: () => const GameOverView(), binding: GameOverBindings()),
  ];
}
