import 'package:communere/app/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';

import '../../domain/entities/photo/photo.dart';
import '../../app/resources/app_text.dart';

class PhotoList extends StatelessWidget {
  final Photos photos;

  const PhotoList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
      itemCount: photos.photo.length,
      itemBuilder: (context, index) {
        final photo = photos.photo[index];
        return ListTile(
          title: photo.title.isNotEmpty
              ? photo.title.toWidget()
              : AppText.titleNotFount.toWidget(),
          leading: CachedNetworkImage(
            height: 80,
            width: 60,
            fit: BoxFit.fill,
            imageUrl:
                "${dotenv.env['LIVE_IMAGE_URL']}${photo.server}/${photo.id}_${photo.secret}_q.jpg",
            placeholder: (context, url) => Lottie.asset('loading_img'.animation,
                width: 70, height: height * 0.50, fit: BoxFit.fill),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
