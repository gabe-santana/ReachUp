import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../globals.dart';

class ReachUpAPI {
  String url;
  Response response;
  Dio dio;

  ReachUpAPI() {
    dio = new Dio();
    dio.options.baseUrl = Globals.urlAPI;
    // dio.interceptors.add(InterceptorControl());

    _config();
  }

  httpPost(String uri, dynamic data) async{
    try {
      this.response = await dio.post(
        "${dio.options.baseUrl}/$uri",
        data: data,
        options: Options(
            
            headers: {"Authorization": "Bearer ${Globals.user.token != null ?  Globals.user.token : 'xpto'}"},
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
    } catch (e) {
      print(e);
    }
  }

  httpGet(String uri) async {
    try {
      this.response = await dio.get(
        "${dio.options.baseUrl}/$uri",
        options: Options(
            headers: {"Authorization":  "Bearer ${Globals.user.token != null ?  Globals.user.token : 'xpto'}"},
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
    } catch (e) {
      print(e);
    }
  }

 httpPatch(String uri, dynamic data) async{
    try {
      this.response = await dio.patch(
        "${dio.options.baseUrl}/$uri",
        data: data,
        options: Options(
            
            headers: {"Authorization": "Bearer ${Globals.user.token != null ?  Globals.user.token : 'xpto'}"},
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
    } catch (e) {
      print(e);
    }
  }

 httpPut(String uri, dynamic data) async{
    try {
      this.response = await dio.put(
        "${dio.options.baseUrl}/$uri",
        data: data,
        options: Options(
            
            headers: {"Authorization": "Bearer ${Globals.user.token != null ?  Globals.user.token : 'xpto'}"},
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
    } catch (e) {
      print(e);
    }
  }

    httpDelete(String uri) async {
    try {
      this.response = await dio.delete(
        "${dio.options.baseUrl}/$uri",
        options: Options(
            headers: {"Authorization":  "Bearer ${Globals.user.token != null ?  Globals.user.token : 'xpto'}"},
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
    dio.options.headers["Authorization"] =  "Bearer ${Globals.user.token != null ?  Globals.user.token : 'xpto'}";
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
