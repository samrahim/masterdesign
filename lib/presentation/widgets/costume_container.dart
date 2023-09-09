import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostumeContainer extends StatelessWidget {
  String textchild;
  CostumeContainer({super.key, required this.textchild});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black),
        padding: const EdgeInsets.all(6),
        child: Text(
          textchild,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
