import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const _paraf = "/";
  final items = {
    _paraf: (context) => const LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.homeDetail.withParaf: (context) => const NavigateHomeDetailView(),
    // "/profile": (context) => const NavigateProfileView()
  };
}

enum NavigateRoutes {
  init,
  home,
  homeDetail,
}

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
