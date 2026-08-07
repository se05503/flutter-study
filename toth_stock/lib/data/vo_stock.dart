import 'package:toth_stock/data/stock_data_provider.dart';

class SimpleStock {
  final String name;
  SimpleStock(this.name);
  factory SimpleStock.fromJson(Map<String, dynamic> json) {
    return SimpleStock(json["name"]);
  }
}

class PopularStock extends SimpleStock with StockDataProvider {

  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  PopularStock({
    required String name,
    required this.yesterdayClosePrice,
    required this.currentPrice,
  }) : super(name);
}

class Stock extends PopularStock {
  final String imagePath;

  Stock({
    required this.imagePath,
    required super.yesterdayClosePrice,
    required super.currentPrice,
    required super.name,
  });
}

List<Stock> get myInterestStocks => [
  Stock(
    name: '한화솔루션',
    imagePath: 'assets/image/interest_stock_01.png',
    currentPrice: 41600,
    yesterdayClosePrice: 41600,
  ),
  Stock(
    name: '현대모비스',
    imagePath: 'assets/image/interest_stock_02.png',
    currentPrice: 219000,
    yesterdayClosePrice: 217000,
  ),
  Stock(
    name: '셀트리온',
    imagePath: 'assets/image/interest_stock_03.png',
    currentPrice: 78000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: '하이브',
    imagePath: 'assets/image/interest_stock_04.png',
    currentPrice: 92300,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: 'LG헬로비전',
    imagePath: 'assets/image/interest_stock_05.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: '대한전선',
    imagePath: 'assets/image/interest_stock_06.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: 'SK하이닉스',
    imagePath: 'assets/image/interest_stock_07.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: '삼성전자',
    imagePath: 'assets/image/interest_stock_08.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: '카카오',
    imagePath: 'assets/image/interest_stock_09.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: 'LG화학',
    imagePath: 'assets/image/interest_stock_10.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
  Stock(
    name: '삼양옵틱스',
    imagePath: 'assets/image/interest_stock_11.png',
    currentPrice: 82000,
    yesterdayClosePrice: 80000,
  ),
];

List<PopularStock> popularStockList = [
  PopularStock(name: "삼성전자", yesterdayClosePrice: 84400, currentPrice: 82500),
  PopularStock(name: "SK하이닉스", yesterdayClosePrice: 190000, currentPrice: 185200),
  PopularStock(name: "삼성바이오로직스", yesterdayClosePrice: 910000, currentPrice: 925000),
  PopularStock(name: "현대차", yesterdayClosePrice: 245000, currentPrice: 243500),
  PopularStock(name: "셀트리온", yesterdayClosePrice: 195000, currentPrice: 202000),
  PopularStock(name: "기아", yesterdayClosePrice: 112000, currentPrice: 112500),
  PopularStock(name: "KB금융", yesterdayClosePrice: 85000, currentPrice: 86200),
  PopularStock(name: "신한지주", yesterdayClosePrice: 55000, currentPrice: 54100),
  PopularStock(name: "NAVER", yesterdayClosePrice: 172000, currentPrice: 175000),
  PopularStock(name: "카카오", yesterdayClosePrice: 38000, currentPrice: 37500),
  PopularStock(name: "LG화학", yesterdayClosePrice: 320000, currentPrice: 318000),
  PopularStock(name: "에코프로비엠", yesterdayClosePrice: 185000, currentPrice: 189500),
];