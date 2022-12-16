import '../../misc/load_data_result.dart';
import '../entity/post/get_post_comment_parameter.dart';
import '../entity/post/get_post_comment_response.dart';
import '../repository/post_repository.dart';

class GetPostComment {
  final PostRepository postRepository;

  GetPostComment({
    required this.postRepository
  });

  Future<LoadDataResult<GetPostCommentResponse>> execute(GetPostCommentParameter getPostCommentParameter) {
    return postRepository.getPostComment(getPostCommentParameter);
  }
}