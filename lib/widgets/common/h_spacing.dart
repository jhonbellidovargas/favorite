import 'package:favorite/utils/utils.dart';
import 'package:flutter/material.dart';

class HSpacing extends StatelessWidget {
  final double percentage;
  const HSpacing(this.percentage, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mqHeigth(context, percentage),
    );
  }
}