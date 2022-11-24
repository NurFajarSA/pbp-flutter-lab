import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCheckbox extends StatefulWidget {
  MyCheckbox({super.key, required this.value});

  bool value;

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.value,
      onChanged: (value) {
        setState(() {
          widget.value = value!;
        });
      },
    );
  }
}
