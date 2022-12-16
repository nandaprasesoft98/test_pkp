import 'package:dio/dio.dart';

import '../../domain/entity/post/create_post_response.dart';
import '../../domain/entity/post/delete_post_response.dart';
import '../../domain/entity/post/edit_post_response.dart';
import '../../domain/entity/post/get_post_comment_response.dart';
import '../../domain/entity/post/get_post_list_response.dart';
import '../../domain/entity/post/get_post_response.dart';
import '../../domain/entity/post/post.dart';
import '../../domain/entity/post/post_comment.dart';
import '../../misc/response_wrapper.dart';

extension PostEntityMapping on Response<dynamic> {
  CreatePostResponse mapFromResponseToCreatePostResponse() {
    return CreatePostResponse();
  }

  DeletePostResponse mapFromResponseToDeletePostResponse() {
    return DeletePostResponse();
  }

  EditPostResponse mapFromResponseToEditPostResponse() {
    return EditPostResponse();
  }

  GetPostResponse mapFromResponseToGetPostResponse() {
    return GetPostResponse(
      post: ResponseWrapper(data).mapToPost()
    );
  }

  GetPostListResponse mapFromResponseToGetPostListResponse() {
    return GetPostListResponse(
      postList: data.map<Post>((response) => ResponseWrapper(response).mapToPost()).toList()
    );
  }

  GetPostCommentResponse mapFromResponseToGetPostCommentResponse() {
    return GetPostCommentResponse(
      postComment: data.map<PostComment>((response) => ResponseWrapper(response).mapToPostComment()).toList()
    );
  }
}

extension PostDetailEntityMapping on ResponseWrapper {
  Post mapToPost() {
    return Post(
      id: response['id'].toString(),
      title: response['title'],
      body: response['body'],
      userId: response['userId'].toString()
    );
  }
}

extension PostCommentEntityMapping on ResponseWrapper {
  PostComment mapToPostComment() {
    return PostComment(
      id: response['id'].toString(),
      postId: response['postId'].toString(),
      name: response['name'],
      email: response['name'],
      body: response['body']
    );
  }
}