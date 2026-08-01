import 'package:flutter/material.dart';
import 'package:toth_stock/data/TossNotification.dart';
import 'package:toth_stock/screen/widget/w_notification_item.dart';
import '../../common/color/colors.dart';

class NotificationDialog extends StatefulWidget {
  final TossNotification notification;

  const NotificationDialog(this.notification, {super.key});

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: widget.notification.isRead
          ? AbstractThemeColors.roundedLayoutBackground
          : AbstractThemeColors.unreadColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: NotificationItem(
              notification: widget.notification,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
