import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/floatActionButtonController.dart';
import 'package:todo_app/widget/itemListWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controllerFAB = Get.put(floatActionButtonController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controllerFAB.testing(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add_box),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("Todo App List"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Obx(() => Itemlist(
                  itemTitle: "Clicked title = " +
                      controllerFAB.clicked.value.toString(),
                  description: "You have clicked FAB for " +
                      controllerFAB.clicked.value.toString() +
                      " Times")))),
    );
  }
}
