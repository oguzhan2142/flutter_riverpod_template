import 'package:education_social_platform_app/global/enum/user_type.dart';
import 'package:education_social_platform_app/global/model/app_response.dart';
import 'package:education_social_platform_app/global/network/network_manager.dart';
import 'package:education_social_platform_app/global/network/request_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/model/auth.dart';

final authRepository = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  Future<AppResponse<Auth>> login({
    required String username,
    required String password,
  }) {
    return NetworkManager.instance.requestSingle<Auth>(
      requestType: RequestType.POST,
      path: '/api/auth/login',
      body: {"username": username, "password": password},
      converter: Auth.fromJson,
    );
  }

  Future<AppResponse<Auth>> register({
    required String username,
    required String password,
    required String mail,
    required String firstName,
    required String lastName,
    required UserType userType,
  }) {
    return NetworkManager.instance.requestSingle<Auth>(
      requestType: RequestType.POST,
      path: '/api/auth/register',
      body: {
        "username": username,
        "password": password,
        "mail": mail,
        "firstName": firstName,
        "lastName": lastName,
        "userType": userType.apiValue,
      },
      converter: Auth.fromJson,
    );
  }
}
