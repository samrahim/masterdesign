import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostumeSearchField extends StatelessWidget {
  CostumeSearchField({super.key, required this.height, required this.width});
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade300),
      height: height / 12,
      width: width - 10,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 22),
            prefixIcon: const Icon(Icons.search, size: 32),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
