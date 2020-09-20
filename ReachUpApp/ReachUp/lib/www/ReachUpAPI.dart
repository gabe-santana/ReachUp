import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ReachUpAPI{
  String url = "https://192.168.0.109:8000/api";
  Response response;
  Dio dio;
  String token;

  ReachUpAPI(String token){
    dio = new Dio();
    _config();
  }

  httpGet(String uri) async
  {
    this.response = await dio.get(
            "${this.url}/$uri",
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }
            ),
          );
  }
  
  _config()
  {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer ${this.token}";
  }

    toList<T>()
    {
        return List<T>.from(this.response.data.map((i) => (T as dynamic).fromJson(i)));
    }
}