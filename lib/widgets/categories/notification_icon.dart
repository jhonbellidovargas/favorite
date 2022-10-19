import 'package:favorite/utils/utils.dart';
import 'package:favorite/widgets/categories/notification_container.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mqHeigth(context, 4),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: mqHeigth(context, 0.4)),
            child: SizedBox(
            width: mqWidth(context, 14),
            child: const Icon(Icons.notifications_none_outlined, size: 30,)
            ),
          ),
          const NotificationContainer(
            left: 28, 
            bottom: 12, 
            textN: '12')
        ]
      ),
    );
  }
}