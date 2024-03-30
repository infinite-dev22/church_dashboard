import 'dart:convert';
import 'dart:ffi';

import 'package:church_dashboard/config/web_config.dart';
import 'package:church_dashboard/data_source/daos/interfaces/simple_dao.dart';
import 'package:church_dashboard/init.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class PersonDaoImpl extends SimpleDao {
  var prefs = getLocalStorage();

  @override
  Future<Long> getCountAll() async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.get(
        'http://localhost:8888/api/v1/users/count',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCountByDateJoined() async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.get(
        'http://localhost:8888/api/v1/users/count/date_joined',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<Map<String, dynamic>> fetch(int id) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.get(
        'http://localhost:8888/api/v1/users/single',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<List<dynamic>> fetchAll() async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));
    dio.options.followRedirects = false;

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      var response = await dio.get(
        'http://localhost:8888/api/v1/users/all',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future post(Map<String, dynamic> data) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.post(
        'http://localhost:8888/api/v1/users/add',
        data: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future put(Map<String, dynamic> data, int id) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.put(
        'http://localhost:8888/api/v1/users/update',
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> search(String search) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.get(
        'http://localhost:8888/api/v1/users/search/',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<dynamic> delete(int id) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.get(
        'http://localhost:8888/api/v1/users/single/delete',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }
}
