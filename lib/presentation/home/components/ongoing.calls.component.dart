part of 'main.components.dart';

class OngoingCalls extends StatelessWidget {
  const OngoingCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ongoing Calls",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: _CallCard(
                name: "Sophia Hayes",
                duration: "2h 45m",
                callCount: 34,
                time: "01:54:30",
                assistant: "David Barr",
                notes: 2,
                id: "35774",
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _CallCard(
                name: "Owen Darnell",
                duration: "3h 10m",
                callCount: 10,
                time: "01:55:38",
                assistant: "Kilian Schönberger",
                notes: 2,
                id: "98745",
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _CallCard(
                name: "Emma Larkin",
                duration: "6h 29m",
                callCount: 29,
                time: "01:56:43",
                assistant: "Jörgen Petersen",
                notes: 2,
                id: "85427",
              ),
            ),
          ],
        ),
      ],
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
      width: 250,
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
