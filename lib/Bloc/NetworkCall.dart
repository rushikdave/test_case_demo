import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkCall {
  var dio = Dio();

  static final NetworkCall _singleton = NetworkCall._internal();
  NetworkCall._internal() {
    print('###### NetworkCall._internal() ########');
    dio = Dio(
      BaseOptions(contentType: 'application/json', headers: {
        'X-Requested-With': 'XmlHttpRequest',
      }),
    );
    // var adapter = BrowserHttpClientAdapter();
    // adapter.withCredentials = true;
    // dio.httpClientAdapter = adapter;
  }

  factory NetworkCall() {
    return _singleton;
  }

  Future<LoginRespone> login({ LoginParameters parameter}) async {
    try {
      final response = await dio.post(
        'https://abcxyz.com/dev/login',
        data: jsonEncode(parameter),
      );
      print('Response - ${response.toString()}');

      if (response.statusCode == 200) {
        Map<dynamic, dynamic> operator;
        operator = response.data['user']['operator'];
        String opertorId = operator.keys.toList()[0];
        print(opertorId);
        // return await get_operator(operatorId: opertorId);
        return LoginRespone.fromJson();
      } else {
        throw Exception('Something went wrong');
      }
    } on Exception catch (e) {
      print(e.toString());
      throw Exception('${e.toString()}');
    }
  }
}

class LoginParameters {
  final String email;
  final String password;

  LoginParameters({ this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class LoginRespone {
  LoginRespone();

  factory LoginRespone.fromJson() {
    return LoginRespone();
  }
}
