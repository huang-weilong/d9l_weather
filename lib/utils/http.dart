import 'package:dio/dio.dart';

class Http {
  static Dio dio;

  factory Http() => _getInstance();
  static Http get instance => _getInstance();
  static Http _instance; // 单例对象

  static Http _getInstance() {
    if (_instance == null) {
      _instance = Http._internal();
    }
    return _instance;
  }

  Http._internal() {
    dio = Dio(BaseOptions(connectTimeout: 60000, receiveTimeout: 15000, sendTimeout: 15000));
    dio.options.baseUrl = rootUrl;
  }

  static final String rootUrl = 'https://free-api.heweather.net/s6';
  static final String key = 'd77fe2f561f44c1b8a8d365ad503e9bf';

  Future get(String path, Map<String, dynamic> params) async {
    try {
      Response response = await dio.get(path, queryParameters: params);
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future post(String path, Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(path, data: data);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
