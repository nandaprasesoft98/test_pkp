import 'package:flutter/material.dart';
import 'package:test_pkp/misc/ext/load_data_result_ext.dart';

import '../../domain/entity/post/create_post_parameter.dart';
import '../../domain/entity/post/create_post_response.dart';
import '../../domain/entity/user/get_user_list_parameter.dart';
import '../../domain/entity/user/get_user_list_response.dart';
import '../../domain/usecase/create_post.dart';
import '../../domain/usecase/get_post.dart';
import '../../domain/usecase/get_user_list.dart';
import '../../misc/load_data_result.dart';

class CreatePostProvider extends ChangeNotifier {
  final GetPost getPost;
  final CreatePost createPost;
  final GetUserList getUserList;

  LoadDataResult<GetUserListResponse> get getUserListResponseLoadDataResult => _getUserListResponseLoadDataResult;
  LoadDataResult<GetUserListResponse> _getUserListResponseLoadDataResult = NoLoadDataResult<GetUserListResponse>();

  CreatePostProvider({
    required this.getPost,
    required this.createPost,
    required this.getUserList
  }) {
    getSelectedUserListResult(GetUserListParameter());
  }

  void getSelectedUserListResult(GetUserListParameter getUserListParameter) async {
    _getUserListResponseLoadDataResult = IsLoadingLoadDataResult<GetUserListResponse>();
    notifyListeners();
    _getUserListResponseLoadDataResult = await getUserList.execute(getUserListParameter);
    notifyListeners();
  }

  void processCreatePost({
    required CreatePostParameter createPostParameter,
    required void Function() showLoading,
    required void Function(CreatePostResponse) successCreatePost,
    required void Function(dynamic) failedCreatePost
  }) async {
    showLoading();
    LoadDataResult<CreatePostResponse> successCreatePostResponse = await createPost.execute(createPostParameter);
    if (successCreatePostResponse.isSuccess) {
      successCreatePost(successCreatePostResponse.resultIfSuccess!);
    } else if (successCreatePostResponse.isFailed) {
      failedCreatePost(successCreatePostResponse.resultIfFailed!);
    }
  }
}