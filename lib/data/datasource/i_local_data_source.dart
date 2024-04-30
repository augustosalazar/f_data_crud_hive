import 'package:f_data_crud/domain/entities/some_data.dart';

abstract class ILocalDataSource {
  Future<void> addEntry(SomeData entry);

  Future<List<SomeData>> getAll();

  Future<void> deleteAll();

  Future<void> deleteEntry(SomeData entry);

  Future<void> updateEntry(SomeData entry);
}
