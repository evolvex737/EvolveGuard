part of 'main.components.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  static List<Map<String, IconData>> data = [
    {Routes.dashboard: Icons.grid_view_rounded},
    {Routes.liveTracking: Icons.bar_chart_rounded},
    {Routes.user: Icons.people_alt_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      // width: 80,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Color(0xFF19191E),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      //   gradient: LinearGradient(
      //     colors: [Color(0xFF19191E), Color(0xFF0B0B0D)],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox.fromSize(
              size: Size(40, 180),
              child: ListView.separated(
                itemBuilder: (context, index) => IconButton(
                  icon: Icon(data[index].values.first, color: Colors.white),
                  onPressed: () => HomeController.instance.navigateTo(data[index].keys.first),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: data.length,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
