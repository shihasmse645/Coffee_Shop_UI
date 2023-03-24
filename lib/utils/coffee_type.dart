import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CoffeeType extends StatelessWidget {
  final String coffeetype;
  final bool isSelected;
  final VoidCallback ontap;
  const CoffeeType({super.key, required this.coffeetype, required this.isSelected, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeetype,
          style:  TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color:isSelected? Colors.orange:Colors.white),
        ),
      ),
    );
  }
}
