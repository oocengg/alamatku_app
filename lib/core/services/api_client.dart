import 'package:alamatku_app/core/constant/app_constant.dart';
import 'package:dio/dio.dart';

class ApiClient {
  // Singleton pattern supaya hanya ada satu instance Dio
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  late final Dio dio;

  ApiClient._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
        "AccessToken":
            "fe17d6c84394e37f804b614871f7fdf60b71f3685df902ee2b5cf59ba5b7da887158ce2702a0f7b2a9ad44e357af6c678bf1",
      },
    );

    dio = Dio(options);
  }
}
