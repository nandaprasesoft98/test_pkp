import 'package:dio/dio.dart';
import 'package:test_pkp/data/entitymapping/user_entity_mapping.dart';

import '../../../domain/entity/user/get_user_list_parameter.dart';
import '../../../domain/entity/user/get_user_list_response.dart';
import 'user_data_source.dart';

class DefaultUserDataSource implements UserDataSource {
  final Dio dio;

  DefaultUserDataSource({
    required this.dio
  });

  @override
  Future<GetUserListResponse> getUserList(GetUserListParameter getUserListParameter) async {
    return (await dio.get("/users")).mapFromResponseToGetUserListResponse();
  }
}