import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/floatActionButtonController.dart';

class Itemlist extends StatelessWidget {
  final String itemTitle, description;
  const Itemlist(
      {super.key, required this.itemTitle, required this.description});

  @override
  Widget build(BuildContext context) {
    final controller1 = Get.put(floatActionButtonController());
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.black),
        color: Colors.blue[100],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(this.itemTitle),
                  Text(this.description),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
