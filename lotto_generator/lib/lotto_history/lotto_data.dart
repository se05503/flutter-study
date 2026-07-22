import 'dart:convert';
import 'package:http/http.dart' as http;

class LottoResult {
  final int ltEpsd; // 회차
  final String ltRflYmd; // 추첨일자 (예: "20251206")
  final int tm1WnNo; // 당첨번호 1
  final int tm2WnNo; // 당첨번호 2
  final int tm3WnNo; // 당첨번호 3
  final int tm4WnNo; // 당첨번호 4
  final int tm5WnNo; // 당첨번호 5
  final int tm6WnNo; // 당첨번호 6
  final int bnsWnNo; // 보너스 번호
  final int rnk1WnNope; // 1등 당첨자 수
  final int rnk1WnAmt; // 1등 개별 당첨금
  final int rnk1SumWnAmt; // 1등 총 당첨금
  final int rnk2WnNope; // 2등 당첨자 수
  final int rnk2WnAmt; // 2등 개별 당첨금
  final int rnk3WnNope; // 3등 당첨자 수
  final int rnk3WnAmt; // 3등 개별 당첨금
  final int rnk4WnAmt; // 4등 당첨금
  final int rnk5WnAmt; // 5등 당첨금
  final int sumWnNope; // 전체 당첨자 수
  final int rlvtEpsdSumNtslAmt; // 해당 회차 판매금액

  LottoResult({
    required this.ltEpsd,
    required this.ltRflYmd,
    required this.tm1WnNo,
    required this.tm2WnNo,
    required this.tm3WnNo,
    required this.tm4WnNo,
    required this.tm5WnNo,
    required this.tm6WnNo,
    required this.bnsWnNo,
    required this.rnk1WnNope,
    required this.rnk1WnAmt,
    required this.rnk1SumWnAmt,
    required this.rnk2WnNope,
    required this.rnk2WnAmt,
    required this.rnk3WnNope,
    required this.rnk3WnAmt,
    required this.rnk4WnAmt,
    required this.rnk5WnAmt,
    required this.sumWnNope,
    required this.rlvtEpsdSumNtslAmt,
  });

  factory LottoResult.fromJson(Map<String, dynamic> json) {
    return LottoResult(
      ltEpsd: json['ltEpsd'],
      ltRflYmd: json['ltRflYmd'],
      tm1WnNo: json['tm1WnNo'],
      tm2WnNo: json['tm2WnNo'],
      tm3WnNo: json['tm3WnNo'],
      tm4WnNo: json['tm4WnNo'],
      tm5WnNo: json['tm5WnNo'],
      tm6WnNo: json['tm6WnNo'],
      bnsWnNo: json['bnsWnNo'],
      rnk1WnNope: json['rnk1WnNope'],
      rnk1WnAmt: json['rnk1WnAmt'],
      rnk1SumWnAmt: json['rnk1SumWnAmt'],
      rnk2WnNope: json['rnk2WnNope'],
      rnk2WnAmt: json['rnk2WnAmt'],
      rnk3WnNope: json['rnk3WnNope'],
      rnk3WnAmt: json['rnk3WnAmt'],
      rnk4WnAmt: json['rnk4WnAmt'],
      rnk5WnAmt: json['rnk5WnAmt'],
      sumWnNope: json['sumWnNope'],
      rlvtEpsdSumNtslAmt: json['rlvtEpsdSumNtslAmt'],
    );
  }
}

Future<LottoResult> fetchLottoResult(int round) async {
  final url =
      "https://www.dhlottery.co.kr/lt645/selectPstLt645Info.do?srchLtEpsd=$round";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final list = jsonData['data']['list'] as List;
    if (list.isNotEmpty) {
      return LottoResult.fromJson(list[0]);
    } else {
      throw Exception("해당 회차 데이터가 없습니다.");
    }
  } else {
    throw Exception("데이터 불러오기 실패: ${response.statusCode}");
  }
}
