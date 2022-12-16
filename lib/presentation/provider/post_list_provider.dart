import 'package:flutter/material.dart';
import 'package:test_pkp/misc/ext/load_data_result_ext.dart';

import '../../domain/entity/post/delete_post_parameter.dart';
import '../../domain/entity/post/delete_post_response.dart';
import '../../domain/entity/post/get_post_list_parameter.dart';
import '../../domain/entity/post/get_post_list_response.dart';
import '../../domain/entity/post/post.dart';
import '../../domain/usecase/delete_post.dart';
import '../../domain/usecase/get_post_list.dart';
import '../../misc/load_data_result.dart';

class PostListProvider extends ChangeNotifier {
  final GetPostList getPostList;
  final DeletePost deletePost;

  LoadDataResult<GetPostListResponse> get getPostListResponseLoadDataResult => _getPostListResponseLoadDataResult;
  LoadDataResult<GetPostListResponse> _getPostListResponseLoadDataResult = NoLoadDataResult<GetPostListResponse>();

  PostListProvider({
    required this.getPostList,
    required this.deletePost
  }) {
    getPostListResult(GetPostListParameter());
  }

  void getPostListResult(GetPostListParameter getPostListParameter) async {
    _getPostListResponseLoadDataResult = IsLoadingLoadDataResult<GetPostListResponse>();
    notifyListeners();
    _getPostListResponseLoadDataResult = await getPostList.execute(getPostListParameter);
    notifyListeners();
  }

  void processDeletePost({
    required DeletePostParameter deletePostParameter,
    required void Function() showLoading,
    required void Function(DeletePostResponse) successDeletePost,
    required void Function(dynamic) failedDeletePost
  }) async {
    showLoading();
    LoadDataResult<DeletePostResponse> successDeletePostResponse = await deletePost.execute(deletePostParameter);
    if (successDeletePostResponse.isSuccess) {
      if (_getPostListResponseLoadDataResult.isSuccess) {
        List<Post> postList = _getPostListResponseLoadDataResult.resultIfSuccess!.postList;
        postList.remove(postList.firstWhere((post) => post.id == deletePostParameter.postId));
      }
      successDeletePost(successDeletePostResponse.resultIfSuccess!);
    } else if (successDeletePostResponse.isFailed) {
      failedDeletePost(successDeletePostResponse.resultIfFailed!);
    }
    notifyListeners();
  }

  void processUpdatePost() {
    notifyListeners();
  }
}