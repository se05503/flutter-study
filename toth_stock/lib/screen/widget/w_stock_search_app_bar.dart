import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const StockSearchAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AbstractThemeColors.appBarBackground,
        height: kToolbarHeight,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                width: 50,
                height: kToolbarHeight,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white, fontSize: 16),
                autofocus: true,
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: '\'하이닉스\'를 입력해보세요',
                  hintStyle: TextStyle(color: AbstractThemeColors.hintText, fontSize: 16),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.close, color: Colors.white),
                ),
                onSubmitted: (content) {
                  debugPrint("ok");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
