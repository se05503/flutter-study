import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/vo_package.dart';
import '../../widget/w_opensource_item.dart';

class OpenSourceScreen extends StatefulWidget {
  const OpenSourceScreen({super.key});

  @override
  State<OpenSourceScreen> createState() => _OpenSourceScreenState();
}

class _OpenSourceScreenState extends State<OpenSourceScreen> {
  List<PackageItem> packageList = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    final String strData = await rootBundle.loadString(
      "assets/json/licenses.json",
    );
    final List<dynamic> jsonData = json.decode(strData);
    setState(() {
      packageList = jsonData.map((json) => PackageItem.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      appBar: AppBar(
        title: Text("오픈소스 패키지"),
        backgroundColor: AbstractThemeColors.appBarBackground,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        itemBuilder: (context, index) => OpenSourceItem(packageList[index]),
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(height: 1, thickness: 1, color: AbstractThemeColors.lessImportantColor),
          );
        },
        itemCount: packageList.length,
      ),
    );
  }
}
