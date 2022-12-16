import 'package:test_pkp/misc/ext/future_ext.dart';

import '../../domain/entity/post/create_post_parameter.dart';
import '../../domain/entity/post/create_post_response.dart';
import '../../domain/entity/post/delete_post_parameter.dart';
import '../../domain/entity/post/delete_post_response.dart';
import '../../domain/entity/post/edit_post_parameter.dart';
import '../../domain/entity/post/edit_post_response.dart';
import '../../domain/entity/post/get_post_comment_parameter.dart';
import '../../domain/entity/post/get_post_comment_response.dart';
import '../../domain/entity/post/get_post_list_parameter.dart';
import '../../domain/entity/post/get_post_list_response.dart';
import '../../domain/entity/post/get_post_parameter.dart';
import '../../domain/entity/post/get_post_response.dart';
import '../../domain/repository/post_repository.dart';
import '../../misc/load_data_result.dart';
import '../datasource/postdatasource/post_data_source.dart';

class DefaultPostRepository extends PostRepository {
  final PostDataSource postDataSource;

  DefaultPostRepository({
    required this.postDataSource
  });

  @override
  Future<LoadDataResult<CreatePostResponse>> createPost(CreatePostParameter createPostParameter) {
    return postDataSource.createPost(createPostParameter).getLoadDataResult();
  }

  @override
  Future<LoadDataResult<DeletePostResponse>> deletePost(DeletePostParameter deletePostParameter) {
    return postDataSource.deletePost(deletePostParameter).getLoadDataResult();
  }

  @override
  Future<LoadDataResult<EditPostResponse>> editPost(EditPostParameter editPostParameter) {
    return postDataSource.editPost(editPostParameter).getLoadDataResult();
  }

  @override
  Future<LoadDataResult<GetPostResponse>> getPost(GetPostParameter getPostParameter) {
    return postDataSource.getPost(getPostParameter).getLoadDataResult();
  }

  @override
  Future<LoadDataResult<GetPostCommentResponse>> getPostComment(GetPostCommentParameter getPostCommentParameter) {
    return postDataSource.getPostCommentResponse(getPostCommentParameter).getLoadDataResult();
  }

  @override
  Future<LoadDataResult<GetPostListResponse>> getPostList(GetPostListParameter getPostListParameter) {
    return postDataSource.getPostList(getPostListParameter).getLoadDataResult();
  }
}