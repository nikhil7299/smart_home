class Route {
  String path;
  String name;
  Route({
    required this.path,
    required this.name,
  });
}

class AppRoutes {
  AppRoutes._();
  static Route onboard = Route(path: '/onboard', name: 'onboard');
  static Route getStarted = Route(path: '/getStarted', name: 'getStarted');

  static Route signUp = Route(path: '/signUp', name: 'signUp');
  static Route signIn = Route(path: '/signIn', name: 'signIn');
  static Route home = Route(path: '/', name: 'home');
}
