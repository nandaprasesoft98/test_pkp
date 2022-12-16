import '../entity/post/create_post_parameter.dart';
import '../entity/post/create_post_response.dart';
import '../entity/post/delete_post_parameter.dart';
import '../entity/post/delete_post_response.dart';
import '../entity/post/edit_post_parameter.dart';
import '../entity/post/edit_post_response.dart';
import '../entity/post/get_post_comment_parameter.dart';
import '../entity/post/get_post_comment_response.dart';
import '../entity/post/get_post_list_parameter.dart';
import '../entity/post/get_post_list_response.dart';
import '../entity/post/get_post_parameter.dart';
import '../entity/post/get_post_response.dart';
import '../../misc/load_data_result.dart';

abstract class PostRepository {
  Future<LoadDataResult<GetPostListResponse>> getPostList(GetPostListParameter getPostListParameter);
  Future<LoadDataResult<GetPostResponse>> getPost(GetPostParameter getPostParameter);
  Future<LoadDataResult<GetPostCommentResponse>> getPostComment(GetPostCommentParameter getPostCommentParameter);
  Future<LoadDataResult<CreatePostResponse>> createPost(CreatePostParameter createPostParameter);
  Future<LoadDataResult<EditPostResponse>> editPost(EditPostParameter editPostParameter);
  Future<LoadDataResult<DeletePostResponse>> deletePost(DeletePostParameter deletePostParameter);
}