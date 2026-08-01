import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/app_colors.dart';
import 'package:toth_stock/data/notifications_dummy.dart';
import 'package:toth_stock/screen/widget/w_notification_item.dart';

import '../../common/color/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryDarkGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("알림", style: TextStyle(color: Colors.grey[300])),
            backgroundColor: AbstractThemeColors.appBarBackground,
            foregroundColor: Colors.grey[300],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  NotificationItem(notification: notificationDummies[index]),
              childCount: notificationDummies.length,
            ),
          ),
        ],
      ),
    );
  }
}
