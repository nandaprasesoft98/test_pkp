import '../../misc/load_data_result.dart';
import '../entity/user/get_user_list_parameter.dart';
import '../entity/user/get_user_list_response.dart';

abstract class UserRepository {
  Future<LoadDataResult<GetUserListResponse>> getUserList(GetUserListParameter getUserListParameter);
}