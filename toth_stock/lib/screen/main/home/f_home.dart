import 'package:flutter/material.dart';
import 'package:toth_stock/data/bank.dart';
import 'package:toth_stock/screen/widget/w_app_bar.dart';
import 'package:toth_stock/screen/widget/w_big_button.dart';
import 'package:toth_stock/screen/widget/w_rounded_container.dart';

import '../../widget/w_bank_account.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(children: [
        SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 120), child: Column(children: [
          BigButton("토스뱅크", onTap: () {}),
          SizedBox(height: 12),
          RoundedContainer(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("자산", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 6),
              ...bankAccounts.map((e) => BankAccountWidget(e))
            ],
          ))
        ])),
        TossAppBar()
      ],),
    );
  }
}
