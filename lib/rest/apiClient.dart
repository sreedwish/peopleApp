import '../models/bean_albums.dart';
import '../models/bean_photos.dart';
import '../models/bean_comments.dart';
import '../models/bean_post.dart';
import '../models/bean_user.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'ipClass.dart';

part 'apiClient.g.dart';

@RestApi(baseUrl: appBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.interceptors.add(LoggingInterceptors());

    return _ApiClient(dio, baseUrl: appBaseUrl);
  }

  //Api calls goes here
  @GET(users)
  Future<List<BeanUser>> getUsers();

  @GET(posts)
  Future<List<BeanPost>?> getPosts(@Query("userId") int userId);

  @GET(comments)
  Future<List<BeanComment>?> getComments(@Query("postId") int postId);

  @GET(albums)
  Future<List<BeanAlbums>?> getAlbums(@Query("userId") int userId);

  @GET(photos)
  Future<List<BeanPhotos>?> getPhotos(@Query("albumId") int albumId);
}

class LoggingInterceptors extends Interceptor {
  bool logEnabled = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (logEnabled) {
      print(
          "--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
      print("Headers:");
      options.headers.forEach((k, v) => print('$k: $v'));
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
      if (options.data != null) {
        print("Body: ${options.data}");
      }
      print("--> END ${options.method.toUpperCase()}");
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (logEnabled) {
      print("<-- ${response.statusCode} ${(response.realUri)}");
      print("Headers:");
      response.headers.forEach((k, v) => print('$k: $v'));
      print("Response: ${response.data}");
      print("<-- END HTTP");
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
