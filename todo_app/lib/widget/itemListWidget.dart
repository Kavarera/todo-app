import 'package:flutter/material.dart';

class Itemlist extends StatelessWidget {
  final String itemTitle, description;

  Map<String, dynamic> toJson() {
    return {
      'itemTitle': itemTitle,
      'description': description,
    };
  }

  // Metode fromJson untuk mengonversi bentuk JSON menjadi objek
  factory Itemlist.fromJson(Map<String, dynamic> json) {
    return Itemlist(
      itemTitle: json['itemTitle'],
      description: json['description'],
    );
  }

  const Itemlist(
      {super.key, required this.itemTitle, required this.description});

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
                  Text(itemTitle),
                  Text(description),
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
