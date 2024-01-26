import 'package:communere/app/base/base_view.dart';
import 'package:communere/app/extentions/extentions.dart';
import 'package:communere/app/resources/app_colors.dart';
import 'package:communere/app/resources/app_text.dart';
import 'package:communere/presentation/components/photo_list.dart';
import 'package:communere/presentation/components/skeleton_list.dart';
import 'package:communere/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  static const String url = "/home";



  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: controller.searchController,
        onSubmitted: (value) => controller.searchButtonHandler(value),
        decoration: InputDecoration(
          hintText: AppText.search,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.clearSearchBox(),
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.isTrue) {
          return const SkeletonList();
        } else {
          return PhotoList(photos: controller.photos.value);
        }
      },
    );
  }
  @override
  Widget noInternetWidget() {
    return Lottie.asset('no_internet'.animation);
  }
@override
  Color pageBackgroundColor() {
    return AppColors.surface;
  }



}
