part of '../main.pages.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:  20.0, left:  20.0, right:  20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderTile(
            title: "User Management",
            subtitle: "Daftar pengguna aktif & histori",
            icon: Icons.people,
            trailing:
                // 🔍 Search TextField
                SizedBox.fromSize(
                  size: Size.fromWidth(350),
                  child: TextField(
                    controller: controller.searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Cari nama pengguna...",
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF2A2A2F),
                      prefixIcon: const Icon(Icons.search, color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
          ),
          SizedBox(height: 24),
          // Wrap populated with filtered list
          Expanded(
            child: Obx(
              () => SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  runAlignment: WrapAlignment.spaceBetween,
                  alignment: WrapAlignment.spaceBetween,
                  children: controller.filteredUsers.map((user) {
                    return _CallCard(
                      name: user['name'],
                      duration: user['duration'],
                      callCount: user['callCount'],
                      time: user['time'],
                      assistant: user['assistant'],
                      notes: user['notes'],
                      id: user['id'],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CallCard extends StatelessWidget {
  final String name;
  final String time;
  final int callCount;
  final String duration;
  final String assistant;
  final int notes;
  final String id;

  const _CallCard({
    required this.name,
    required this.time,
    required this.callCount,
    required this.duration,
    required this.assistant,
    required this.notes,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFF142D16),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/45745570?v=4?s=400',
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF0B0D0B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.call, color: Colors.greenAccent, size: 16),
              const SizedBox(width: 4),
              Text('$callCount', style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 16),
              const Icon(Icons.schedule, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(duration, style: const TextStyle(color: Colors.white)),
            ],
          ),
          const Divider(color: Colors.white24, height: 24),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              Text(assistant, style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 16),
              const Icon(Icons.notes, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              Text('$notes', style: const TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: List.generate(
              32,
              (index) => Icon(
                Icons.circle,
                size: 8,
                color: index % 7 == 0
                    ? Colors.amber
                    : index % 5 == 0
                    ? Colors.white
                    : Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('ID $id', style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
