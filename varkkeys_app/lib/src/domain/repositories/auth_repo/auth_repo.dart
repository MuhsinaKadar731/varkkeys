import 'package:dartz/dartz.dart';
import 'package:varkkeys_app/src/core/network/failure.dart';

import '../../../data/models/login_response/login_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> login(String username, String password);
}
