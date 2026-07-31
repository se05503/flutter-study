enum NotificationType {
  tossPay('토스페이', 'assets/image/ic_toss_pay.png'),
  luck('행운복권', 'assets/image/ic_luck.png'),
  purchase('공동구매', 'assets/image/ic_purchase.png'),
  stock('토스증권 콘텐츠', 'assets/image/ic_stock.png'),
  walk('만보기', 'assets/image/ic_walk.png'),
  moneyTip('오늘의 머니 팁', 'assets/image/ic_money_tip.png');

  final String name;
  final String iconPath;

  const NotificationType(this.name, this.iconPath);
}