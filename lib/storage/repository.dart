import 'package:people_app/models/bean_albums.dart';
import 'package:people_app/models/bean_comments.dart';
import 'package:people_app/models/bean_photos.dart';
import 'package:people_app/models/bean_post.dart';
import 'package:people_app/models/bean_user.dart';
import 'package:people_app/rest/apiClient.dart';
import 'package:dio/dio.dart';

class Repository {
  ApiClient _apiClient = ApiClient(new Dio());

  Repository._init();

  static final Repository _instance = Repository._init();

  factory Repository() {
    return _instance;
  }

  static final Map<int, BeanUser> _users = Map();
  static final Map<int, List<BeanPost>> _posts = Map();
  static final Map<int, List<BeanComment>> _comments = Map();
  static final Map<int, List<BeanAlbums>> _albums = Map();
  static final Map<int, List<BeanPhotos>> _photos = Map();

  Future<List<BeanUser>> getUsers() async {
    List<BeanUser> returnList = [];

    if (_users.isEmpty) {
      try {
        final list = await _apiClient.getUsers();

        if (list.isNotEmpty) {
          for (BeanUser u in list) {
            _users[u.id!] = u;
          }
        }
      } catch (e) {}
    }

    try {
      returnList.addAll(_users.values.toList());
    } catch (e) {
      print(e);
    }

    return returnList;
  }

  Future<List<BeanPost>> getPosts(int userId) async {
    List<BeanPost> returnList = [];

    if (_posts.isEmpty || (_posts[userId] == null)) {
      try {
        final list = await _apiClient.getPosts(userId);

        if (list != null) {
          _posts[userId] = list;
        }
      } catch (e) {}
    }

    try {
      returnList.addAll(_posts[userId] ?? []);
    } catch (e) {
      print(e);
    }

    return returnList;
  }

  Future<List<BeanComment>> getComments(int postId) async {
    List<BeanComment> returnList = [];

    if (_comments.isEmpty || (_comments[postId] == null)) {
      try {
        final list = await _apiClient.getComments(postId);

        if (list != null) {
          _comments[postId] = list;
        }
      } catch (e) {}
    }

    try {
      returnList.addAll(_comments[postId] ?? []);
    } catch (e) {
      print(e);
    }

    return returnList;
  }

  Future<List<BeanAlbums>> getAlbums(int userId) async {
    List<BeanAlbums> returnList = [];

    if (_albums.isEmpty || (_albums[userId] == null)) {
      try {
        final list = await _apiClient.getAlbums(userId);

        if (list != null) {
          _albums[userId] = list;
        }
      } catch (e) {}
    }

    try {
      returnList.addAll(_albums[userId] ?? []);
    } catch (e) {
      print(e);
    }

    return returnList;
  }

  Future<List<BeanPhotos>> getPhotos(int albumId) async {
    List<BeanPhotos> returnList = [];

    if (_photos.isEmpty || (_photos[albumId] == null)) {
      try {
        final list = await _apiClient.getPhotos(albumId);

        if (list != null) {
          _photos[albumId] = list;
        }
      } catch (e) {}
    }

    try {
      returnList.addAll(_photos[albumId] ?? []);
    } catch (e) {
      print(e);
    }

    return returnList;
  }
}
