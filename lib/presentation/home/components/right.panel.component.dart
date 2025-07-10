part of 'main.components.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      // color: const Color(0xFF1A1A1F),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Starting calls",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _ListItem(title: "Liam Grayson"),
          _ListItem(title: "Mia Jennings"),
          const SizedBox(height: 24),
          const Text(
            "Break",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _ListItem(title: "Jack Linton", subtitle: "Cigarette break"),
          _ListItem(title: "Samuel Waters", subtitle: "Lunch break"),
          _ListItem(title: "Henry Mercer", subtitle: "Lunch break"),
          _ListItem(title: "Amelia Rowann", subtitle: "Cigarette break"),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFFFFC36A)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "+278k\nOutsourced employees",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _ListItem({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.white54,
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Color(0xFF4CAF50),
          shape: BoxShape.circle,
        ),
        child: const CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(
            "https://avatars.githubusercontent.com/u/45745570?v=4?s=400",
          ),
        ),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: (subtitle != null)
          ? Text(
              subtitle!,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            )
          : null,
    );
  }
}
