part of 'main.navigation.dart';

class Routes {
  static Future<String> get initialRoute async =>
      // todo: implement method
      auth;

  static const dashboard = '/dashboard';
  static const home = '/home';
  static const liveTracking = '/live-tracking';
  static const notFound = '/not-found';
  static const user = '/user';
  static const auth = '/auth';
}
