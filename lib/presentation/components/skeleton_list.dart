// skeleton_list.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Lottie.asset('assets/animations/loading_img.json',width:  70,height:Get.height * 0.50,fit: BoxFit.fill),
          minLeadingWidth: 50,
          title: Lottie.asset('assets/animations/loading_txt.json',height: Get.height * 0.120),
        );
      },
    );
  }
}
