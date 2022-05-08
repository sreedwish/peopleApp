import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/bean_photos.dart';

class PhotoExpand extends StatelessWidget {
  BeanPhotos? photo;
  String title = '';

  @override
  Widget build(BuildContext context) {
    if (photo == null) {
      photo = ModalRoute.of(context)!.settings.arguments as BeanPhotos;
      title = photo!.title ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: CachedNetworkImage(
            imageUrl: photo!.url ?? '',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
                width: 40, height: 40, child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
