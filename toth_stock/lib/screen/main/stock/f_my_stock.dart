import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/screen/widget/w_rounded_container.dart';

import '../../widget/LongButton.dart';
import '../../widget/w_interest_stock_list.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myAccount(context),
        SizedBox(height: 20),
        interestedStocks(context),
      ],
    );
  }

  Widget myAccount(BuildContext context) => Container(
    color: AbstractThemeColors.roundedLayoutBackground,
    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "계좌",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Text(
                "15원",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(width: 8),
              SvgPicture.asset(
                'assets/image/ic_arrow_right.svg',
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              Expanded(child: Container()),
              RoundedContainer(
                borderRadius: 8,
                backgroundColor: AbstractThemeColors.buttonBackground,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  "채우기",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Divider(color: AbstractThemeColors.divider, thickness: 1, height: 1),
        const LongButton(title: "주문내역"),
        const LongButton(title: "판매수익"),
      ],
    ),
  );

  Widget interestedStocks(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    color: AbstractThemeColors.roundedLayoutBackground,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "관심 주식",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "편집하기",
              style: TextStyle(
                color: AbstractThemeColors.lessImportantColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("기본", style: TextStyle(color: Colors.white)),
            SvgPicture.asset(
              "assets/image/ic_arrow_right.svg",
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                AbstractThemeColors.lessImportantColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        InterestStockList()
      ],
    ),
  );
}
