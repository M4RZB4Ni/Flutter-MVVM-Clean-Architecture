// Import necessary packages and files.
import 'package:communere/app/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Widget to display a skeleton list with loading animations.
class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the device height for dynamic sizing.
    final height = MediaQuery.of(context).size.height;

    // Use ListView.builder to generate a list of skeleton items.
    return ListView.builder(
      itemCount: 25, // Define the number of skeleton items.
      itemBuilder: (context, index) {
        return ListTile(
          leading: Lottie.asset('loading_img'.animation,
              width: 70, height: height * 0.50, fit: BoxFit.fill),
          minLeadingWidth: 50,
          title: Lottie.asset('loading_txt'.animation, height: height * 0.120),
        );
      },
    );
  }
}
