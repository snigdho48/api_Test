import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.value.value == false) {
          Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => showDatePicker(
                            context: context,
                            initialDate: controller.startdate.value,
                            firstDate: DateTime(1000),
                            lastDate: DateTime(2101),
                          ),
                      child: Text(controller.date(controller.startdate.value))),
                  ElevatedButton(
                      onPressed: () => showDatePicker(
                            context: context,
                            initialDate: controller.lastdate.value,
                            firstDate: DateTime(1000),
                            lastDate: DateTime(2101),
                          ),
                      child: Text(controller.date(controller.lastdate.value))),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.value.value = false;
                    controller.getModel();
                  },
                  child: Text('Get Data')),
              Column(
                children: [
                  for (var i = 0; i < controller.lmodel.length; i++)
                    ListTile(
                      leading: Text('Type ${controller.lmodel[i].type}'),
                      title: Text(
                          'Title ${controller.lmodel[i].features![0].properties!.title}'),
                      subtitle: Text(
                          'Place ${controller.lmodel[i].features![0].properties!.place}'),
                      trailing: Text(
                          'Status ${controller.lmodel[i].features![0].properties!.status}'),
                    )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
