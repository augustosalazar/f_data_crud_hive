import '../../data/datasource/local_data_source.dart';
import '../entities/some_data.dart';

class DataRepository {
  late LocalDataSource localDataSource;

  DataRepository() {
    localDataSource = LocalDataSource();
  }

  Future<List<SomeData>> getAll() async => await localDataSource.getAll();
  Future<void> addEntry(SomeData entry) async =>
      await localDataSource.addEntry(entry);
  Future<void> deleteEntry(SomeData entry) async =>
      await localDataSource.deleteEntry(entry);
  Future<void> deleteAll() async => await localDataSource.deleteAll();
  Future<void> updateEntry(SomeData entry) async =>
      await localDataSource.updateEntry(entry);
}
