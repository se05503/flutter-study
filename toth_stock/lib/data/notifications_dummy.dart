import 'package:toth_stock/data/NotificationType.dart';
import 'package:toth_stock/data/TossNotification.dart';

final notificationDummies = <TossNotification>[
  TossNotification(NotificationType.tossPay, '이번주에 영화 한편 어때요? CGV 할인 쿠폰이 도착했어요', DateTime.now().subtract(const Duration(minutes: 27))),
  TossNotification(NotificationType.stock, '인적분할에 대해 알려드릴게요.', DateTime.now().subtract(const Duration(hours: 1))),
  TossNotification(NotificationType.walk, "1,000걸음 이상 걸었다면 포인트 받으세요.", DateTime.now().subtract(Duration(hours: 1))),
  TossNotification(NotificationType.moneyTip, '유럽 식품 물가가 치솟고 있어요.\n유럽여행에 관심이 있다면 확인해보세요.', DateTime.now().subtract(Duration(hours: 8))),
  TossNotification(NotificationType.walk, "오늘 1,000걸음을 넘겼어요. 포인트를 받아보세요.", DateTime.now().subtract(Duration(hours: 11))),
  TossNotification(NotificationType.luck, '오늘 행운복권이 도착했어요.', DateTime.now().subtract(Duration(hours: 12))),
  TossNotification(NotificationType.purchase, '띵동! 월요일 공동구매 보러가기', DateTime.now().subtract(Duration(hours: 12)))
];