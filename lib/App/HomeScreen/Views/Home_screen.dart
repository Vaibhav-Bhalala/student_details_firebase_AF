import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_detail/App/Utils/Helper/Cloud_Firestore_Helper/cloud_firestore_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController IdController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  String? name;
  String? Id;
  String? Course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Add details Here"),
              content: SizedBox(
                height: 300,
                child: Column(children: [
                  TextFormField(
                    controller: nameController,
                    onChanged: (val) {
                      name = val;
                    },
                    decoration: InputDecoration(
                        hintText: " Add Name", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: courseController,
                    onChanged: (val) {
                      Course = val;
                    },
                    decoration: InputDecoration(
                        hintText: " Add Course", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: IdController,
                    onChanged: (val) {
                      Id = val;
                    },
                    decoration: InputDecoration(
                        hintText: " Add Id", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        nameController.clear();
                        IdController.clear();
                        courseController.clear();
                        Get.back();
                        log("${name}");

                        CloudFirestoreHelper.cloudFirestoreHelper
                            .addUser(data: {
                          'name': name,
                          'course': Course,
                          'Id': Id,
                        });
                      },
                      child: Text("Add")),
                ]),
              ),
            ),
          );
        },
        label: Text("Add Details"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
