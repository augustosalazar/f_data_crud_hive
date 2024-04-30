import '../entities/some_data.dart';
import '../repositories/i_data_repository.dart';

class DataUseCase {
  final IDataRepository repository;

  DataUseCase(this.repository);

  Future<List<SomeData>> getAll() async => await repository.getAll();
  Future<void> addEntry(SomeData entry) async =>
      await repository.addEntry(entry);
  Future<void> deleteEntry(SomeData entry) async =>
      await repository.deleteEntry(entry);
  Future<void> deleteAll() async => await repository.deleteAll();
  Future<void> updateEntry(SomeData entry) async =>
      await repository.updateEntry(entry);
}
