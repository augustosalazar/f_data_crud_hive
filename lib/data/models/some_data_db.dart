import 'package:hive/hive.dart';

part 'some_data_db.g.dart';

@HiveType(typeId: 1)
class SomeDataDb extends HiveObject {
  SomeDataDb({required this.name, required this.description});

  @HiveField(0)
  String name;

  @HiveField(1)
  String description;
}
