import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:monitoring/infrastructure/navigation/main.navigation.dart';

import 'components/main.components.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return context.responsiveValue(
      desktop: _DesktopDashboard(),
      mobile: _MobileDashboard(),
    );
  }
}

class _MobileDashboard extends StatelessWidget {
  const _MobileDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0D),
      appBar: appBar(),
      body: Nav.localNavigator,
    );
  }
}

class _DesktopDashboard extends StatelessWidget {
  const _DesktopDashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0D),
      appBar: appBar(),
      body: SafeArea(
        child: Row(
          children: [
            const Sidebar(),
            Expanded(child: Nav.localNavigator),
            const RightPanel(),
          ],
        ),
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: const Color(0xFF0B0B0D),
    title: Image.asset("assets/icons/evo3.png", scale: 5.5),
    actions: [
      Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xFF19191E)),
          // gradient: LinearGradient(
          //   colors: [Color(0xFF19191E), Color(0xFF0B0B0D)],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: Row(
          children: [
            SizedBox.fromSize(
              size: Size.fromWidth(80),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/45745570?v=4?s=400",
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/45745570?v=4?s=400",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/45745570?v=4?s=400",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              "12 of 15 on work",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            const Text("2 on break", style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
      const SizedBox(width: 16),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PopupMenuButton<String>(
          offset: const Offset(0, 50),
          color: const Color(0xFF2A2A2F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (value) {
            if (value == 'profile') {
              // Navigasi ke halaman profil
              // Get.toNamed(
              //   '/profile',
              // ); // atau Navigator.pushNamed(context, '/profile');
            } else if (value == 'logout') {
              // Tampilkan dialog konfirmasi logout
              Get.dialog(
                AlertDialog(
                  backgroundColor: const Color(0xFF0B0B0D),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  content: const Text(
                    'Apakah Anda yakin ingin keluar?',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Batal',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Get.offAllNamed(
                          Routes.auth,
                        ); // atau authController.logout();
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem<String>(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Profile", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Logout", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
          child: TextButton.icon(
            onPressed:
                null, // biarkan null karena sudah dibungkus PopupMenuButton
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 0, right: 8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(100),
                  right: Radius.circular(15),
                ),
              ),
            ),
            icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/45745570?v=4?s=400",
                ),
              ),
            ),
            label: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "James Radcliffe",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Admin",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
