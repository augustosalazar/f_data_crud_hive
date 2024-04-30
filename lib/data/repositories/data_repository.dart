import '../../domain/entities/some_data.dart';
import '../../domain/repositories/i_data_repository.dart';
import '../datasource/i_local_data_source.dart';

class DataRepository implements IDataRepository {
  final ILocalDataSource localDataSource;

  DataRepository(this.localDataSource);

  @override
  Future<List<SomeData>> getAll() async => await localDataSource.getAll();
  @override
  Future<void> addEntry(SomeData entry) async =>
      await localDataSource.addEntry(entry);
  @override
  Future<void> deleteEntry(SomeData entry) async =>
      await localDataSource.deleteEntry(entry);
  @override
  Future<void> deleteAll() async => await localDataSource.deleteAll();
  @override
  Future<void> updateEntry(SomeData entry) async =>
      await localDataSource.updateEntry(entry);
}
