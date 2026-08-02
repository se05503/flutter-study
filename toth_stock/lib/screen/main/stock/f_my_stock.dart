import 'package:flutter/material.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      myAccount,
      SizedBox(height: 20),
      interestedStocks,
    ],);
  }

  Widget get myAccount => Placeholder();
  Widget get interestedStocks => Placeholder();
}
