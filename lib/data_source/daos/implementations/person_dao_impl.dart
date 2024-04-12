import 'dart:convert';

import 'package:church_dashboard/config/web_config.dart';
import 'package:church_dashboard/data_source/daos/interfaces/simple_dao.dart';
import 'package:church_dashboard/init.dart';
import 'package:http/http.dart' as http;

class PersonDaoImpl extends SimpleDao {
  var prefs = getLocalStorage();
  var client = http.Client();

  @override
  Future<int> getCountAll() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response =
          await client.get(Uri.http(appUrl, '/api/v1/users/count'), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as int;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<List<dynamic>> getCountByDateJoined() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await client
          .get(Uri.http(appUrl, '/api/v1/users/count/date_joined'), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as List;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<Map<String, dynamic>> fetch(int id) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response =
          await client.get(Uri.http(appUrl, '/api/v1/users/single'), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<List<dynamic>> fetchAll() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response =
          await client.get(Uri.http(appUrl, '/api/v1/users/all'), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as List;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future post(Map<String, dynamic> data) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await client.post(Uri.http(appUrl, '/api/v1/users/add'),
          headers: headers, body: jsonEncode(data));

      print('Response: ${jsonDecode(utf8.decode(response.bodyBytes)) as dynamic}');
      print('Response Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future put(Map<String, dynamic> data, int id) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await client.put(Uri.http(appUrl, '/api/v1/users/update'),
          headers: headers, body: jsonEncode(data));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> search(String search) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await client.get(
          Uri.http(appUrl, '/api/v1/users/search', {'search': search}),
          headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes))
            as List<Map<String, dynamic>>;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<dynamic> delete(int id) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var response = await client.delete(
          Uri.http(appUrl, '/api/v1/users/single/delete'),
          headers: headers,
          body: jsonEncode({'id': id}));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      } else {
        throw Error();
      }
    } finally {
      client.close();
    }
  }
}
