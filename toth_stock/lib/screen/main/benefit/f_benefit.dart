import 'package:flutter/material.dart';
import 'package:toth_stock/data/vo_benefit.dart';
import 'package:toth_stock/screen/main/s_main_screen.dart';
import 'package:toth_stock/screen/widget/w_benefit_item.dart';
import 'package:toth_stock/screen/widget/w_point_button.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: MainScreen.bottomNavigationHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("혜택", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(height: 20,),
              const PointButton(point: 569),
              SizedBox(height: 20,),
              Text("혜택 더 받기", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ...benefitDummies.map((element) => BenefitItem(benefit: element))
            ],
          ),
        ),
      ),
    );
  }
}
