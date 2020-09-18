import 'dart:io';
import 'dart:convert';

import 'package:ReachUp/Model/Local.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

const String url = "https://192.168.0.109:5000/api";

class LocalRepository{
   String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbUBlbWFpbC5jb20iLCJyb2xlIjoiYWRtIiwibmJmIjoxNTk5NzI4MDg5LCJleHAiOjE1OTk3MzUyODksImlhdCI6MTU5OTcyODA4OX0.hHJOw0IwUWk9kwje10AsZHmJ8GcIBZvvtqrKqDIvDeI";
   Future<List<Local>> search(String s) async{
    
      Response response;
      Dio dio = new Dio();
      
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };

      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer ${token}";
     
     response = await dio.get(
          "$url/Local/Search?s=$s",
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }
          ),
        );

      print(response.data.toString());   

      List<Local> locates;
      if(response.statusCode == 200)
      {
         locates = List<Local>.from(response.data.map((i) => Local.fromJson(i)));
      }
      return locates;
    }
}