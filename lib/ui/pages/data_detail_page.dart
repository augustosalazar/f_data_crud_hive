import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../controllers/data_controller.dart';

class DataDetailPage extends StatefulWidget {
  const DataDetailPage({Key? key}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<DataDetailPage> {
  SomeData entry = Get.arguments[0];

  final controllerName = TextEditingController();
  final controllerCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    logInfo('DataDetailPage for index ${entry.id}');
    DataController dataController = Get.find();
    controllerName.text = entry.name;
    controllerCity.text = entry.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(entry.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await dataController.deleteEntry(entry);
              Get.back();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                key: const Key('TextFieldCity'),
                controller: controllerCity,
                decoration: const InputDecoration(
                  labelText: 'City',
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            SomeData updated = SomeData.id(entry.id ?? 0,
                                name: controllerName.text,
                                description: controllerCity.text);

                            await dataController.updateEntry(updated);
                            Get.back();
                          },
                          child: const Text("Save")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
