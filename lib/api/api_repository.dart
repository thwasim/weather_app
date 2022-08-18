import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  final String? url;
  final Map<String,dynamic>? payload;

  ApiRepository({ this.url,  this.payload});

  Dio _dio = Dio();

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }){
    _dio.get(url!, queryParameters:this.payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
      return
      CircularProgressIndicator();
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
