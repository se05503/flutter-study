import 'package:toth_stock/data/stock_data_provider.dart';

class SimpleStock {
  final String name;

  SimpleStock(this.name);
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
