import '../../../domain/entity/user/get_user_list_parameter.dart';
import '../../../domain/entity/user/get_user_list_response.dart';

abstract class UserDataSource {
  Future<GetUserListResponse> getUserList(GetUserListParameter getUserListParameter);
}