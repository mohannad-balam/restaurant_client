import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screentasia/screentasia.dart';
import '../../constant/asset_files.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              animate: true,
              AssetLotties.noData,
              width: 50.wp,
              height: 50.hp,
              repeat: true,
            ),
          ],
        ),
      ),
    );
  }
}
