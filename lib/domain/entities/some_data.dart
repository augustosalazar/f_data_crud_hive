class SomeData {
  int? id;
  final String name;
  final String description;

  SomeData({required this.name, required this.description});

  SomeData.id(int this.id, {required this.name, required this.description});
}
