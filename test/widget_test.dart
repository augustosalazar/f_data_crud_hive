// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:f_data_crud/ui/controllers/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:f_data_crud/main.dart';
import 'package:mockito/mockito.dart';

class MockUserController extends GetxService
    with Mock
    implements DataController {
  final RxList<SomeData> _dataList = <SomeData>[].obs;
  @override
  List<SomeData> get data => _dataList;
  int cont = 0;

  @override
  Future onInit() {
    super.onInit();
    return Future.value(true);
  }

  @override
  Future<void> deleteEntry(SomeData entry) async {
    // delete user via usecase and call getAll
    _dataList.remove(entry);
    await getAll();
  }

  @override
  Future<void> deleteAll() async {
    _dataList.clear();
    await getAll();
  }
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
  });
}
