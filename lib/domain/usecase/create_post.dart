import '../../misc/load_data_result.dart';
import '../entity/post/create_post_parameter.dart';
import '../entity/post/create_post_response.dart';
import '../repository/post_repository.dart';

class CreatePost {
  final PostRepository postRepository;

  CreatePost({
    required this.postRepository
  });

  Future<LoadDataResult<CreatePostResponse>> execute(CreatePostParameter createPostParameter) {
    return postRepository.createPost(createPostParameter);
  }
}