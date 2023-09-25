import 'package:f_data_crud/domain/entities/some_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';
import '../pages/data_detail_page.dart';

class ListItem extends StatelessWidget {
  final SomeData entry;
  const ListItem(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.find();
    int id = entry.id ?? 0;
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Deleting",
                style: TextStyle(color: Colors.white),
              ),
            )),
        onDismissed: (direction) {
          // Remove the item from the data source.
          dataController.deleteEntry(entry);
        },
        child: Card(
          key: Key('item$id'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(entry.name),
                  subtitle: Text(entry.description),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const DataDetailPage(), arguments: [entry]);
                },
                child: const Text("more"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
