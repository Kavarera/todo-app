import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/page/list_todo_page.dart';
import 'package:todo_app/routes/page_route.dart';

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
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListTodoPage(),
      getPages: ListPageRoute.pages,
    );
  }
}
