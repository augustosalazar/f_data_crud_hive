import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

import '../models/some_data_db.dart';
import 'i_local_data_source.dart';

class LocalDataSource implements ILocalDataSource {
  @override
  Future<void> addEntry(SomeData entry) async {
    logInfo("Adding entry to db");
    Hive.box('someData')
        .add(SomeDataDb(name: entry.name, description: entry.description));
  }

  @override
  Future<List<SomeData>> getAll() async {
    return Hive.box('someData')
        .values
        .map((entry) => SomeData.id(
            id: entry.key, name: entry.name, description: entry.description))
        .toList();
  }

  @override
  Future<void> deleteAll() async {
    await Hive.box('someData').clear();
  }

  @override
  deleteEntry(SomeData entry) async {
    await Hive.box('someData').delete(entry.id);
  }

  @override
  updateEntry(SomeData entry) async {
    logInfo("Updating entry with id ${entry.id}");
    await Hive.box('someData').put(
        entry.id,
        SomeDataDb(
          name: entry.name,
          description: entry.description,
        ));
  }
}
