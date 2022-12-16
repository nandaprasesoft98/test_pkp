import 'package:dio/dio.dart';
import 'package:test_pkp/data/entitymapping/post_entity_mapping.dart';

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
import 'post_data_source.dart';

class DefaultPostDataSource implements PostDataSource {
  final Dio dio;

  DefaultPostDataSource({
    required this.dio
  });

  @override
  Future<CreatePostResponse> createPost(CreatePostParameter createPostParameter) async {
    FormData createPostData = FormData.fromMap(
      <String, dynamic> {
        "userId": createPostParameter.userId,
        "title": createPostParameter.title,
        "body": createPostParameter.body,
      }
    );
    return (await dio.post("/posts", data: createPostData)).mapFromResponseToCreatePostResponse();
  }

  @override
  Future<DeletePostResponse> deletePost(DeletePostParameter deletePostParameter) async {
    return (await dio.delete("/posts/${deletePostParameter.postId}")).mapFromResponseToDeletePostResponse();
  }

  @override
  Future<EditPostResponse> editPost(EditPostParameter editPostParameter) async {
    FormData createPostData = FormData.fromMap(
      <String, dynamic> {
        "id": editPostParameter.postId,
        "userId": editPostParameter.userId,
        "title": editPostParameter.title,
        "body": editPostParameter.body,
      }
    );
    return (await dio.put("/posts/${editPostParameter.postId}", data: createPostData)).mapFromResponseToEditPostResponse();
  }

  @override
  Future<GetPostResponse> getPost(GetPostParameter getPostParameter) async {
    return (await dio.get("/posts/${getPostParameter.postId}")).mapFromResponseToGetPostResponse();
  }

  @override
  Future<GetPostListResponse> getPostList(GetPostListParameter getPostListParameter) async {
    return (await dio.get("/posts")).mapFromResponseToGetPostListResponse();
  }

  @override
  Future<GetPostCommentResponse> getPostCommentResponse(GetPostCommentParameter getPostCommentParameter) async {
    return (await dio.get("/posts/${getPostCommentParameter.postId}/comments")).mapFromResponseToGetPostCommentResponse();
  }
}