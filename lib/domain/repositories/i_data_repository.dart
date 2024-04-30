import '../entities/some_data.dart';

abstract class IDataRepository {
  Future<List<SomeData>> getAll();
  Future<void> addEntry(SomeData entry);
  Future<void> deleteEntry(SomeData entry);
  Future<void> deleteAll();
  Future<void> updateEntry(SomeData entry);
}
