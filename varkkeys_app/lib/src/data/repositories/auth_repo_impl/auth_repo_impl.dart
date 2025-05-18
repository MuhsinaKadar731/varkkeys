import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:varkkeys_app/src/core/network/error_handler.dart';
import 'package:varkkeys_app/src/core/network/failure.dart';
import 'package:varkkeys_app/src/data/models/login_response/login_response.dart';
import 'package:varkkeys_app/src/domain/repositories/auth_repo/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepo {
  static const String _baseUrl = "https://varkkyslearning.pythonanywhere.com/api/login/";

  @override
  Future<Either<Failure, LoginResponse>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      final result = handleResponse(response);

      if (result is Failure) {
        return Left(result);
      }

      // result is decoded JSON Map
      final loginResponse = LoginResponse.fromJson(result);
      return Right(loginResponse);
    } catch (e) {
      return Left(DefaultFailure());
    }
  }
}
