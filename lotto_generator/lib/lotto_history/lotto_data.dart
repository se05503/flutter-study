import 'dart:convert';

import 'package:http/http.dart' as http;

class LottoResult {
  final int totSellamnt; // 총 판매금액
  final String returnValue; // success
  final String drwNoDate; // 추첨일
  final int firstWinamnt; // 1등 당첨금
  final int drwtNo1;
  final int drwtNo2;
  final int drwtNo3;
  final int drwtNo4;
  final int drwtNo5;
  final int drwtNo6;
  final int bnusNo; // 보너스 번호
  final int firstPrzwnerCo; // 1등 당첨자 수
  final int firstAccumamnt; // 1등 총 당첨금
  final int drwNo; // 회차

  LottoResult({
    required this.totSellamnt,
    required this.returnValue,
    required this.drwNoDate,
    required this.firstWinamnt,
    required this.drwtNo1,
    required this.drwtNo2,
    required this.drwtNo3,
    required this.drwtNo4,
    required this.drwtNo5,
    required this.drwtNo6,
    required this.bnusNo,
    required this.firstPrzwnerCo,
    required this.firstAccumamnt,
    required this.drwNo,
  });

  factory LottoResult.fromJson(Map<String, dynamic> json) {
    return LottoResult(
      totSellamnt: json['totSellamnt'],
      returnValue: json['returnValue'],
      drwNoDate: json['drwNoDate'],
      firstWinamnt: json['firstWinamnt'],
      drwtNo1: json['drwtNo1'],
      drwtNo2: json['drwtNo2'],
      drwtNo3: json['drwtNo3'],
      drwtNo4: json['drwtNo4'],
      drwtNo5: json['drwtNo5'],
      drwtNo6: json['drwtNo6'],
      bnusNo: json['bnusNo'],
      firstPrzwnerCo: json['firstPrzwnerCo'],
      firstAccumamnt: json['firstAccumamnt'],
      drwNo: json['drwNo'],
    );
  }
}

Future<LottoResult> fetchLottoResult(int round) async {
  final url =
      "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=$round";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData["returnValue"] == "success") {
      return LottoResult.fromJson(jsonData);
    } else {
      throw Exception("API 호출 실패: $jsonData['returnValue']");
    }
  } else {
    throw Exception("데이터 불러오기 실패: ${response.statusCode}");
  }
}
