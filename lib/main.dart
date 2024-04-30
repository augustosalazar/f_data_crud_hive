import 'package:f_data_crud/data/datasource/i_local_data_source.dart';
import 'package:f_data_crud/data/models/some_data_db.dart';
import 'package:f_data_crud/ui/controllers/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/datasource/local_data_source.dart';
import 'data/repositories/data_repository.dart';
import 'domain/repositories/i_data_repository.dart';
import 'domain/use_cases/data_use_case.dart';
import 'ui/my_app.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(SomeDataDbAdapter());
  boxList.add(await Hive.openBox('someData'));
  return boxList;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _openBox();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put<ILocalDataSource>(LocalDataSource());
  Get.put<IDataRepository>(DataRepository(Get.find()));
  Get.put(DataUseCase(Get.find()));
  Get.put(DataController());
  runApp(const MyApp());
}
