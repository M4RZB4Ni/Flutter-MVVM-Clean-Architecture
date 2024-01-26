import 'package:communere/app/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Lottie.asset('loading_img'.animation,
              width: 70, height: height * 0.50, fit: BoxFit.fill),
          minLeadingWidth: 50,
          title: Lottie.asset('loading_txt'.animation,
              height: height * 0.120),
        );
      },
    );
  }
}
