import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ReachUpAPI{
  String url = "http://192.168.0.109:5000/api";
  Response response;
  Dio dio;
  String token;

  ReachUpAPI(){
    token = token;
    dio = new Dio();
    _config();
  }

  httpGet(String uri) async
  {
    this.response = await dio.get(
            "${this.url}/$uri",
            options: Options(
              headers: {
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbUBlbWFpbC5jb20iLCJyb2xlIjoiYWRtIiwibmJmIjoxNjAyODcwMzExLCJleHAiOjE2MDI4Nzc1MTEsImlhdCI6MTYwMjg3MDMxMX0.cu4OV5HU3feCJSJjdc37TqTGj2BYXB1yFulZ9fbXpaA"
              },
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


}