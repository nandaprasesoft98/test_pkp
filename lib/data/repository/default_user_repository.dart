import 'package:test_pkp/misc/ext/future_ext.dart';

import '../../domain/entity/user/get_user_list_parameter.dart';
import '../../domain/entity/user/get_user_list_response.dart';
import '../../domain/repository/user_repository.dart';
import '../../misc/load_data_result.dart';
import '../datasource/userdatasource/user_data_source.dart';

class DefaultUserRepository extends UserRepository {
  final UserDataSource userDataSource;

  DefaultUserRepository({
    required this.userDataSource
  });

  @override
  Future<LoadDataResult<GetUserListResponse>> getUserList(GetUserListParameter getUserListParameter) {
    return userDataSource.getUserList(getUserListParameter).getLoadDataResult();
  }
}