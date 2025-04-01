import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/use_cases/data_use_case.dart';

class DataController extends GetxController {
  final RxList<SomeData> _dataList = <SomeData>[].obs;
  List<SomeData> get data => _dataList;
  final DataUseCase dataUseCase;

  DataController(this.dataUseCase);

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  Future<void> getAll() async {
    _dataList.value = await dataUseCase.getAll();
    _dataList.refresh();
    logInfo("dataController -> get all users -> ${_dataList.length}");
  }

  Future<void> addEntry(SomeData entry) async {
    logInfo("dataController -> add user");
    await dataUseCase.addEntry(entry);
    await getAll();
  }

  Future<void> deleteEntry(SomeData entry) async {
    logInfo("dataController -> delete user");
    await dataUseCase.deleteEntry(entry);
    await getAll();
  }

  Future<void> deleteAll() async {
    logInfo("dataController -> delete all users");
    await dataUseCase.deleteAll();
    await getAll();
  }

  Future<void> updateEntry(SomeData entry) async {
    logInfo("dataController -> update user with id ${entry.id}");
    await dataUseCase.updateEntry(entry);
    await getAll();
  }
}
