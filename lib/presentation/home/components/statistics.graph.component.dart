part of 'main.components.dart';

class StatisticsGraph extends StatelessWidget {
  const StatisticsGraph({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for Graph
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E23),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text("Graph Here", style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}
