import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:f_data_crud/ui/controllers/data_controller.dart';
import 'package:f_data_crud/ui/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';

class DataListPage extends StatelessWidget {
  DataListPage({super.key});

  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Data list"),
          actions: <Widget>[
            IconButton(
                key: const Key('deleteAllButton'),
                onPressed: () {
                  dataController.deleteAll();
                },
                icon: const Icon(Icons.delete))
          ]),
      floatingActionButton: FloatingActionButton(
        key: const Key('addUserButton'),
        child: const Icon(Icons.add),
        onPressed: () async {
          var randomNames = RandomNames(Zone.us);
          await dataController.addEntry(SomeData(
              name: randomNames.name(), description: randomNames.surname()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getXlistView(),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: dataController.data.length,
        itemBuilder: (context, index) {
          final entry = dataController.data[index];
          return ListItem(entry);
        },
      ),
    );
  }
}
