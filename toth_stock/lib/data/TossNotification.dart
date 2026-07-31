import 'package:toth_stock/data/NotificationType.dart';

class TossNotification {
  final NotificationType type;
  final String description;
  final DateTime time;

  TossNotification(this.type, this.description, this.time);
}