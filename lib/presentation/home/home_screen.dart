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

// HomeScreen widget, extending BaseView and associated with HomeViewModel.
class HomeScreen extends BaseView<HomeViewModel> {
  // Define the route URL for navigation.
  static const String url = "/home";

  // Constructor for HomeScreen.
  HomeScreen({super.key});

  // Override the appBar method to define the app bar for the screen.
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      // TextField for search functionality.
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

  // Override the body method to define the main content of the screen.
  @override
  Widget body(BuildContext context) {
    return Obx(
          () {
        // Display either a skeleton list or the actual PhotoList based on loading state.
        if (controller.isLoading.isTrue) {
          return const SkeletonList();
        } else {
          return PhotoList(photos: controller.photos.value);
        }
      },
    );
  }

  // Override the noInternetWidget method to display a Lottie animation for no internet.
  @override
  Widget noInternetWidget() {
    return Lottie.asset('no_internet'.animation);
  }

  // Override the pageBackgroundColor method to define the background color of the screen.
  @override
  Color pageBackgroundColor() {
    return AppColors.surface;
  }
}
