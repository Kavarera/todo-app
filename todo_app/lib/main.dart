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
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD MAIN DART DIJALANKAN");
    final controllerFAB = Get.put(floatActionButtonController());
    debugPrint(controllerFAB.itemList.toString());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controllerFAB.showBottomSheet(context),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_box),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Todo App List"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controllerFAB.itemList.length,
            itemBuilder: (_, index) {
              debugPrint("main di eksekusi");
              return Itemlist(model: controllerFAB.itemList[index]);
            },
          ),
        ),
      ),
    );
  }
}
