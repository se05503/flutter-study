class Benefit {
  final String imagePath;
  final String title;
  final String subTitle;

  Benefit({required this.imagePath, required this.title, required this.subTitle});
}

final benefitDummies = <Benefit>[
  Benefit(imagePath: "assets/image/ic_benefit_hand.png", title: "포인트 받기", subTitle: "친구와 함께 토스 켜고"),
  Benefit(imagePath: "assets/image/ic_benefit_mark.png", title: "얼마 받을지 보기", subTitle: "이번 주 미션하면"),
  Benefit(imagePath: "assets/image/ic_benefit_luck.png", title: "포인트 받기", subTitle: "오늘의 행운복권"),
  Benefit(imagePath: "assets/image/ic_benefit_live.png", title: "포인트 받기", subTitle: "라이브 쇼핑 보고"),
  Benefit(imagePath: "assets/image/ic_benefit_quiz.png", title: "추가 혜택 보기", subTitle: "행운퀴즈 종료"),
  Benefit(imagePath: "assets/image/ic_benefit_walk.png", title: "140원 받기", subTitle: "만보기"),
];