import 'package:flutter/material.dart';
import 'package:test_pkp/misc/ext/load_data_result_ext.dart';

import '../../domain/entity/post/edit_post_parameter.dart';
import '../../domain/entity/post/edit_post_response.dart';
import '../../domain/entity/post/get_post_parameter.dart';
import '../../domain/entity/post/get_post_response.dart';
import '../../domain/entity/user/get_user_list_parameter.dart';
import '../../domain/entity/user/get_user_list_response.dart';
import '../../domain/entity/user/user.dart';
import '../../domain/usecase/edit_post.dart';
import '../../domain/usecase/get_post.dart';
import '../../domain/usecase/get_user_list.dart';
import '../../misc/load_data_result.dart';

class EditPostProvider extends ChangeNotifier {
  final GetPost getPost;
  final EditPost editPost;
  final GetUserList getUserList;
  final String postId;

  User? selectedUser;

  LoadDataResult<GetPostResponse> get getPostListResponseLoadDataResult => _getPostListResponseLoadDataResult;
  LoadDataResult<GetPostResponse> _getPostListResponseLoadDataResult = NoLoadDataResult<GetPostResponse>();

  LoadDataResult<GetUserListResponse> get getUserListResponseLoadDataResult => _getUserListResponseLoadDataResult;
  LoadDataResult<GetUserListResponse> _getUserListResponseLoadDataResult = NoLoadDataResult<GetUserListResponse>();

  void Function(GetPostResponse)? onGetPostResponse;

  EditPostProvider({
    required this.getPost,
    required this.editPost,
    required this.getUserList,
    required this.postId,
    required this.onGetPostResponse
  }) {
    getSelectedPostAndUserListResult(
      GetPostParameter(postId: postId),
      GetUserListParameter()
    );
  }

  void getSelectedPostAndUserListResult(GetPostParameter getPostParameter, GetUserListParameter getUserListParameter) async {
    await getSelectedPostResult(getPostParameter);
    await getSelectedUserListResult(getUserListParameter);
  }

  Future<void> getSelectedPostResult(GetPostParameter getPostParameter) async {
    _getPostListResponseLoadDataResult = IsLoadingLoadDataResult<GetPostResponse>();
    notifyListeners();
    _getPostListResponseLoadDataResult = await getPost.execute(getPostParameter);
    notifyListeners();
    if (_getPostListResponseLoadDataResult.isSuccess) {
      if (onGetPostResponse != null) {
        onGetPostResponse!(_getPostListResponseLoadDataResult.resultIfSuccess!);
      }
    }
  }

  Future<void> getSelectedUserListResult(GetUserListParameter getUserListParameter) async {
    _getUserListResponseLoadDataResult = IsLoadingLoadDataResult<GetUserListResponse>();
    notifyListeners();
    _getUserListResponseLoadDataResult = await getUserList.execute(getUserListParameter);
    if (_getUserListResponseLoadDataResult.isSuccess && _getPostListResponseLoadDataResult.isSuccess) {
      GetUserListResponse getUserListResponse = _getUserListResponseLoadDataResult.resultIfSuccess!;
      Iterable<User> users = getUserListResponse.userList.where((user) => user.id == _getPostListResponseLoadDataResult.resultIfSuccess!.post.userId);
      if (users.isNotEmpty) {
        selectedUser = users.first;
      }
    }
    notifyListeners();
  }

  void processEditPost({
    required EditPostParameter editPostParameter,
    required void Function() showLoading,
    required void Function(EditPostResponse) successEditPost,
    required void Function(dynamic) failedEditPost
  }) async {
    showLoading();
    LoadDataResult<EditPostResponse> successEditPostResponse = await editPost.execute(editPostParameter);
    if (successEditPostResponse.isSuccess) {
      successEditPost(successEditPostResponse.resultIfSuccess!);
    } else if (successEditPostResponse.isFailed) {
      failedEditPost(successEditPostResponse.resultIfFailed!);
    }
  }
}