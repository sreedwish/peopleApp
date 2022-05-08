import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_app/blocs/photos/photo_bloc_cubit.dart';
import 'package:people_app/constants.dart';
import '../models/bean_photos.dart';

class Photos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<PhotoBlocCubit, PhotoBlocState>(
          builder: (context, state) {
            if (state is PhotoBlocLoading) {
              return Center(child: const CircularProgressIndicator());
            }

            if (state is PhotoBlocGetState) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.list.length,
                itemBuilder: (context, i) {
                  BeanPhotos photo = state.list[i];

                  return WidgetPhoto(photo);
                },
              );
            }

            return Center(child: const Text('No Photos!'));
          },
        ),
      ),
    );
  }
}

class WidgetPhoto extends StatelessWidget {
  final BeanPhotos photo;

  const WidgetPhoto(this.photo);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: CachedNetworkImage(
            imageUrl: photo.thumbnailUrl ?? '',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
                width: 20, height: 20, child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(routePhotoExpand, arguments: photo);
        },
      ),
    );
  }
}
