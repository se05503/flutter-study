import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/TossNotification.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItem extends StatefulWidget {
  final TossNotification notification;

  const NotificationItem({super.key, required this.notification});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  static const iconWidth = 24.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      color: widget.notification.isRead ? AbstractThemeColors.roundedLayoutBackground : AbstractThemeColors.unreadColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(widget.notification.type.iconPath, width: iconWidth),
              Text(
                widget.notification.type.name,
                style: TextStyle(
                  color: AbstractThemeColors.lessImportantColor,
                  fontSize: 12,
                ),
              ),
              Expanded(child: Container()),
              Text(timeago.format(widget.notification.time, locale: 'ko'), style: TextStyle(color: AbstractThemeColors.lessImportantColor, fontSize: 13)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: iconWidth),
            child: Text(widget.notification.description, style: TextStyle(color: Colors.grey[300], fontSize: 14),),
          ),
        ],
      ),
    );
  }
}
