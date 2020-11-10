import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../globals.dart';

class ReachUpAPI{
  String url;
  Response response;
  Dio dio;
  String token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNsaUBlbWFpbC5jb20iLCJyb2xlIjoiY2xpIiwibmJmIjoxNjA0OTY0MDEyLCJleHAiOjE2MDUwNTA0MTIsImlhdCI6MTYwNDk2NDAxMn0.mBisWSp5Carj6MXkU5ciXgc_71u9P1blKCFr0fqo-8A";

  ReachUpAPI(){
    dio = new Dio();
    dio.options.baseUrl = Globals.urlAPI;
    // dio.interceptors.add(InterceptorControl());

    _config();
  }

  httpGet(String uri) async {
    try {
      this.response = await dio.get(
        "${dio.options.baseUrl}/$uri",
        options: Options(
            headers: {
              "Authorization":
                  this.token
            },
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
    } catch (e) {
      print(e);
    }
  }

  _config() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${this.token}";
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
