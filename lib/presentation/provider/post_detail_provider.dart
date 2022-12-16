import 'package:flutter/material.dart';
import 'package:test_pkp/misc/ext/load_data_result_ext.dart';

import '../../domain/entity/post/get_post_comment_parameter.dart';
import '../../domain/entity/post/get_post_comment_response.dart';
import '../../domain/entity/post/get_post_parameter.dart';
import '../../domain/entity/post/get_post_response.dart';
import '../../domain/usecase/get_post.dart';
import '../../domain/usecase/get_post_comment.dart';
import '../../misc/load_data_result.dart';

class PostDetailProvider extends ChangeNotifier {
  final GetPost getPost;
  final GetPostComment getPostComment;
  final String postId;

  LoadDataResult<GetPostResponse> get getPostListResponseLoadDataResult => _getPostListResponseLoadDataResult;
  LoadDataResult<GetPostResponse> _getPostListResponseLoadDataResult = NoLoadDataResult<GetPostResponse>();

  LoadDataResult<GetPostCommentResponse> get getPostCommentResponseLoadDataResult => _getPostCommentResponseLoadDataResult;
  LoadDataResult<GetPostCommentResponse> _getPostCommentResponseLoadDataResult = NoLoadDataResult<GetPostCommentResponse>();

  PostDetailProvider({
    required this.getPost,
    required this.getPostComment,
    required this.postId
  }) {
    getSelectedPostResult(GetPostParameter(postId: postId));
    getSelectedPostCommentResult(GetPostCommentParameter(postId: postId));
  }

  Future<void> getSelectedPostResult(GetPostParameter getPostParameter) async {
    _getPostListResponseLoadDataResult = IsLoadingLoadDataResult<GetPostResponse>();
    notifyListeners();
    _getPostListResponseLoadDataResult = await getPost.execute(getPostParameter);
    notifyListeners();
  }

  Future<void> getSelectedPostCommentResult(GetPostCommentParameter getPostCommentParameter) async {
    _getPostCommentResponseLoadDataResult = IsLoadingLoadDataResult<GetPostCommentResponse>();
    notifyListeners();
    _getPostCommentResponseLoadDataResult = await getPostComment.execute(getPostCommentParameter);
    notifyListeners();
  }
}