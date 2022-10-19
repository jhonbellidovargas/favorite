import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.left,
    required this.bottom,
    required this.textN,
  }) : super(key: key);

  final double left;
  final double bottom;
  final String textN;

  @override
  Widget build(BuildContext context) {
    return textN != "0" ?
    Positioned(
      left: left,
      bottom: bottom,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.pink,
        ),
        child: Text(textN, style: soChipTextStyle),
      ),
    ) : Container();
    
  }
}