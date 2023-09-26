import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

import '../models/some_data_db.dart';

class LocalDataSource {
  Future<void> addEntry(SomeData entry) async {
    logInfo("Adding entry to db");
    Hive.box('someData')
        .add(SomeDataDb(name: entry.name, description: entry.description));
  }

  Future<List<SomeData>> getAll() async {
    return Hive.box('someData')
        .values
        .map((entry) => SomeData.id(
            id: entry.key, name: entry.name, description: entry.description))
        .toList();
  }

  Future<void> deleteAll() async {
    await Hive.box('someData').clear();
  }

  deleteEntry(SomeData entry) {
    Hive.box('someData').delete(entry.id);
  }

  updateEntry(SomeData entry) {
    logInfo("Updating entry with id ${entry.id}");
    Hive.box('someData').put(
        entry.id,
        SomeDataDb(
          name: entry.name,
          description: entry.description,
        ));
  }
}
