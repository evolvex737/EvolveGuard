part of 'main.navigation.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.green,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
      children: [
        GetPage(
          name: Routes.dashboard,
          page: () => const DashboardScreen(),
          binding: DashboardControllerBinding(),
        ),
        GetPage(
          name: Routes.liveTracking,
          page: () => const LiveTrackingScreen(),
          binding: LiveTrackingControllerBinding(),
        ),
        GetPage(
          name: Routes.user,
          page: () => const UserScreen(),
          binding: UserControllerBinding(),
        ),
      ],
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthScreen(),
      binding: AuthControllerBinding(),
    ),
  ];
  static Navigator get localNavigator => Navigator(
        key: HomeController.instance.navigatorKey,
        onGenerateRoute: onGenerateRoute,
        initialRoute: Routes.dashboard,
      );

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var matchingPage = Nav.routes.first.children.firstWhere(
      (page) => settings.name!.contains(page.name),
      // Jika rute tidak ditemukan, kembalikan rute default atau 404
      orElse: () => GetPage(name: Routes.notFound, page: () => PageNotFound()),
    );
    if (matchingPage.children.isNotEmpty) {
      matchingPage = matchingPage.children.firstWhere(
        (page) => settings.name!.contains(page.name),
        // Jika rute tidak ditemukan, kembalikan rute default atau 404
        orElse: () => GetPage(
          name: Routes.notFound,
          page: () => PageNotFound(),
          // binding: NotControllerBinding(),
        ),
      );
    }
    return _getPageRoute(matchingPage, settings);
  }

  static PageRoute _getPageRoute(GetPage content, RouteSettings? settings) =>
      GetPageRoute(
        middlewares: content.middlewares,
        title: content.name.replaceAll('/', '').capitalizeFirst!,
        parameter: content.parameters,
        page: content.page,
        bindings: content.bindings,
        binding: content.binding,
        routeName: content.name,
        settings: settings,
      );
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 80,
                color: Get.theme.colorScheme.error,
              ),
              const SizedBox(height: 20),
              Text(
                '404',
                style: Get.theme.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Halaman tidak ditemukan',
                style: Get.theme.textTheme.titleLarge?.copyWith(
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'URL yang Anda tuju tidak tersedia atau telah dipindahkan.',
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Kembali ke Beranda'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Future(
                  () => HomeController.instance.count.value = 0,
                ).whenComplete(
                  () => HomeController.instance.navigateTo(Routes.dashboard),
                ),
                // Ganti dengan home route kamu
              ),
            ],
          ),
        ),
      ),
    );
  }
}
