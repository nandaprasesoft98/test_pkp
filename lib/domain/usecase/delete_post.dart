import '../../misc/load_data_result.dart';
import '../entity/post/delete_post_parameter.dart';
import '../entity/post/delete_post_response.dart';
import '../repository/post_repository.dart';

class DeletePost {
  final PostRepository postRepository;

  DeletePost({
    required this.postRepository
  });

  Future<LoadDataResult<DeletePostResponse>> execute(DeletePostParameter deletePostParameter) {
    return postRepository.deletePost(deletePostParameter);
  }
}