import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class DataController extends GetxController {
  final RxList<SomeData> _dataList = <SomeData>[].obs;

  List<SomeData> get data => _dataList;

  Future<void> getAll() async {
    // bring data from repository via usecase and update the list
  }

  Future<void> addEntry(SomeData entry) async {
    logInfo("dataController -> add user");
    // add user via usecase and call getAll
    entry.id = _dataList.length + 1;
    _dataList.add(entry);
    await getAll();
  }

  Future<void> deleteEntry(SomeData entry) async {
    logInfo("dataController -> delete user");
    // delete user via usecase and call getAll
    _dataList.remove(entry);
    await getAll();
  }

  Future<void> deleteAll() async {
    logInfo("dataController -> delete all users");
    // delete all users via usecase and call getAll
    _dataList.clear();
    await getAll();
  }

  Future<void> updateEntry(SomeData entry) async {
    logInfo("dataController -> update user with id ${entry.id}");
    // update user via usecase and call getAll
    final index = _dataList.value.indexWhere((item) => item.id == entry.id);
    _dataList[index] = entry;
    await getAll();
  }
}
