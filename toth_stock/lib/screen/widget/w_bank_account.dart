import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/screen/widget/w_rounded_container.dart';

import '../../data/bank.dart';

class BankAccountWidget extends StatelessWidget {
  final BankAccount account;

  const BankAccountWidget(this.account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(account.bank.logoImg, width: 40),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.accountTypeName ?? "${account.bank.name} 통장",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  "${NumberFormat('#,###').format(account.balance)}원",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        RoundedContainer(
          backgroundColor: AbstractThemeColors.buttonBackground,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: 10,
          child: Text(
            "송금",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
