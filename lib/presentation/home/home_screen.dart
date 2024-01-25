import 'package:cached_network_image/cached_network_image.dart';
import 'package:communere/app/base/base_view.dart';
import 'package:communere/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends BaseView<HomeViewModel> {
  static const String url = "/home";

  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      title: TextField(
        controller: controller.searchController,
        onSubmitted: (value) {
          if (value.isEmpty) {
            controller.getRecentPhotos(); // Fetch recent photos if search criteria is empty
          } else {
            controller.searchPhotos(value);
          }
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller.searchController.clear();
              controller.isLoading.value=true;
              controller.getRecentPhotos();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
          () {
        if (controller.isLoading.value) {
          return _buildSkeletonList();
        } else {
          return _buildPhotoList();
        }
      },
    );
  }

  Widget _buildSkeletonList() {
    return ListView.builder(
      itemCount: 25,
      itemBuilder: (context, index) {
        return const ListTile(
          title: SizedBox(height: 60,width: 60,child: Placeholder(fallbackHeight: 60,fallbackWidth: 60,)),
        );
      },
    );
  }

  Widget _buildPhotoList() {
    return ListView.separated(
      itemCount: controller.photos.value.photo.length,
      itemBuilder: (context, index) {
        final photo = controller.photos.value.photo[index];
        return ListTile(
          title: Text(photo.title),
          leading: CachedNetworkImage(
            width: 80,
            fit: BoxFit.fill,
            height: 180,
            imageUrl:"https://live.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_q.jpg",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      }, separatorBuilder:(context, index) => const Divider(),
    );
}


}
