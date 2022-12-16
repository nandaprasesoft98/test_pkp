import '../../misc/load_data_result.dart';
import '../entity/user/get_user_list_parameter.dart';
import '../entity/user/get_user_list_response.dart';
import '../repository/user_repository.dart';

class GetUserList {
  final UserRepository userRepository;

  GetUserList({
    required this.userRepository
  });

  Future<LoadDataResult<GetUserListResponse>> execute(GetUserListParameter getUserListParameter) {
    return userRepository.getUserList(getUserListParameter);
  }
}