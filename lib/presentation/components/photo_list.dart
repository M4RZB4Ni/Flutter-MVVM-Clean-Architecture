// Import necessary packages and files.
import 'package:communere/app/extentions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// Import the Photo entity and AppText resources.
import '../../domain/entities/photo/photo.dart';
import '../../app/resources/app_text.dart';

// Widget to display a list of photos.
class PhotoList extends StatelessWidget {
  final Photos photos;

  // Constructor to initialize the widget with a list of photos.
  const PhotoList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    // Get the device height for dynamic sizing.
    final height = MediaQuery.of(context).size.height;

    // Check if the list of photos is not empty.
    return photos.photo.isNotEmpty
        ? ListView.separated(
            itemCount: photos.photo.length,
            itemBuilder: (context, index) {
              // Get the photo at the current index.
              final photo = photos.photo[index];
              return ListTile(
                title: photo.title.isNotEmpty
                    ? photo.title
                        .toWidget() // Display the photo title if available.
                    : AppText.titleNotFound
                        .toWidget(), // Display a default text if title is not available.
                leading: CachedNetworkImage(
                  height: 80.r,
                  width: 60.r,
                  fit: BoxFit.fill,
                  imageUrl:
                      "${dotenv.env['LIVE_IMAGE_URL']}${photo.server}/${photo.id}_${photo.secret}_q.jpg",
                  placeholder: (context, url) => Lottie.asset(
                      'loading_img'.animation,
                      width: 70,
                      height: height * 0.50,
                      fit: BoxFit.fill),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          )
        : Center(
            // Display a Lottie animation if the list of photos is empty.
            child: Lottie.asset('nothing_found'.animation, fit: BoxFit.fill),
          );
  }
}
