import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_app/blocs/albums/albums_bloc.dart';
import 'package:people_app/blocs/photos/photo_bloc_cubit.dart';

import '../models/bean_albums.dart';
import 'package:people_app/constants.dart';
import 'package:people_app/uiUtilities/styles.dart';

class Albums extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<AlbumsBloc, AlbumsState>(
          builder: (context, state) {
            if (state is AlbumsLoading) {
              return Center(child: const CircularProgressIndicator());
            }

            if (state is AlbumsGet) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.list.length,
                itemBuilder: (context, i) {
                  BeanAlbums albums = state.list[i];

                  return WidgetAlbum(albums);
                },
              );
            }

            return Center(child: const Text('No Albums!'));
          },
        ),
      ),
    );
  }
}

class WidgetAlbum extends StatelessWidget {
  final BeanAlbums albums;

  const WidgetAlbum(this.albums);

  @override
  Widget build(BuildContext context) {
    String title = albums.title ?? '';

    return InkWell(
      child: Card(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Text(
            title.toUpperCase(),
            style: headline1.copyWith(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: () {
        context.read<PhotoBlocCubit>().getPhotos(albums.id ?? 0);

        Navigator.of(context).pushNamed(routePhotos);
      },
    );
  }
}
