// photo_list.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../domain/entities/photo/photo.dart';

class PhotoList extends StatelessWidget {
  final Photos photos;

  const PhotoList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: photos.photo.length,
      itemBuilder: (context, index) {
        final photo = photos.photo[index];
        return ListTile(
          title: Text(photo.title.isNotEmpty
              ? photo.title
              : "Title is not passed from server"),
          leading: CachedNetworkImage(
            height: 80,
            width: 60,
            fit: BoxFit.fill,
            imageUrl:
                "https://live.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_q.jpg",
            placeholder: (context, url) => Lottie.asset(
                'assets/animations/loading_img.json',
                width: 70,
                height: Get.height * 0.50,
                fit: BoxFit.fill),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
