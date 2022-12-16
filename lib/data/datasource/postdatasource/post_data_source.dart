import '../../../domain/entity/post/create_post_parameter.dart';
import '../../../domain/entity/post/create_post_response.dart';
import '../../../domain/entity/post/delete_post_parameter.dart';
import '../../../domain/entity/post/delete_post_response.dart';
import '../../../domain/entity/post/edit_post_parameter.dart';
import '../../../domain/entity/post/edit_post_response.dart';
import '../../../domain/entity/post/get_post_comment_parameter.dart';
import '../../../domain/entity/post/get_post_comment_response.dart';
import '../../../domain/entity/post/get_post_list_parameter.dart';
import '../../../domain/entity/post/get_post_list_response.dart';
import '../../../domain/entity/post/get_post_parameter.dart';
import '../../../domain/entity/post/get_post_response.dart';

abstract class PostDataSource {
  Future<GetPostListResponse> getPostList(GetPostListParameter getPostListParameter);
  Future<GetPostResponse> getPost(GetPostParameter getPostParameter);
  Future<GetPostCommentResponse> getPostCommentResponse(GetPostCommentParameter getPostCommentParameter);
  Future<CreatePostResponse> createPost(CreatePostParameter createPostParameter);
  Future<EditPostResponse> editPost(EditPostParameter editPostParameter);
  Future<DeletePostResponse> deletePost(DeletePostParameter deletePostParameter);
}