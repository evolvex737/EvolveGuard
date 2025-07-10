part of '../../main.pages.dart';

class UserController extends GetxController {
  //todo: Implement UserController

  final TextEditingController searchController = TextEditingController();
  final RxList<Map<String, dynamic>> allUsers = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredUsers =
      <Map<String, dynamic>>[].obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    allUsers.assignAll(dummyUsers); // from step 1
    filteredUsers.assignAll(dummyUsers);
    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      filteredUsers.assignAll(
        allUsers.where((user) {
          return user['name'].toString().toLowerCase().contains(query);
        }),
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

final List<Map<String, dynamic>> dummyUsers = List.generate(40, (index) {
  final baseUsers = [
    {
      "name": "Sophia Hayes",
      "duration": "2h 45m",
      "callCount": 34,
      "time": "01:54:30",
      "assistant": "David Barr",
    },
    {
      "name": "Owen Darnell",
      "duration": "3h 10m",
      "callCount": 10,
      "time": "01:55:38",
      "assistant": "Kilian Schönberger",
    },
    {
      "name": "Emma Larkin",
      "duration": "6h 29m",
      "callCount": 29,
      "time": "01:56:43",
      "assistant": "Jörgen Petersen",
    },
    {
      "name": "Liam Bennett",
      "duration": "4h 22m",
      "callCount": 17,
      "time": "02:10:05",
      "assistant": "Marta Nikole",
    },
    {
      "name": "Ava Coleman",
      "duration": "5h 03m",
      "callCount": 21,
      "time": "03:15:22",
      "assistant": "Leo Ishikawa",
    },
  ];

  final base = baseUsers[index % baseUsers.length];
  return {...base, "notes": (index % 5) + 1, "id": (35000 + index).toString()};
});
