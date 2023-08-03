import 'package:flutter/material.dart';
import 'package:todo_app/model/todoModel.dart';

class Itemlist extends StatelessWidget {
  final TodoModel model;

  const Itemlist({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
        color: Colors.blue[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(model.title),
                  Text(model.description),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
