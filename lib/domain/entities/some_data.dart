class SomeData {
  int? id;
  final String name;
  final String description;

  SomeData({required this.name, required this.description});

  SomeData.id({this.id, required this.name, required this.description});
}
