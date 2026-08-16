import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';
import '../../data/vo_package.dart';

class OpenSourceItem extends StatelessWidget {
  final PackageItem packageItem;

  const OpenSourceItem(this.packageItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Text(
                packageItem.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Text(
                packageItem.version,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AbstractThemeColors.lessImportantColor,
                ),
              ),
            ],
          ),
        ),
        if (packageItem.description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              packageItem.description,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        if (packageItem.repository.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              packageItem.repository,
              style: TextStyle(
                fontSize: 12,
                color: AbstractThemeColors.lessImportantColor,
              ),
            ),
          ),
        if (packageItem.license.isNotEmpty)
          Container(
            height: 230,
            decoration: BoxDecoration(
              color: AbstractThemeColors.drawerBg,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: SingleChildScrollView(
              child: Text(
                packageItem.license,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ),
          ),
      ],
    );
  }
}
