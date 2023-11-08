import 'package:dio/dio.dart';
import 'package:flutter_base/models/response/array_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/entities/movie_entity.dart';
import '../models/entities/notification/notification_entity.dart';
import '../models/entities/token_entity.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  @POST("/login")
  Future<TokenEntity> authLogin(@Body() Map<String, dynamic> body);

  @POST("/logout")
  Future<dynamic> signOut(@Body() Map<String, dynamic> body);

  /// Notification
  @GET("https://run.mocky.io/v3/9b8edbf7-7865-4d8f-8f4a-2ead3553d73f")
  Future<ArrayResponse<NotificationEntity>> getNotifications();

  /// Movie
  @GET("/3/discover/movie")
  Future<ArrayResponse<MovieEntity>> getMovies(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );
}
