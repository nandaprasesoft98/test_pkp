import '../../misc/load_data_result.dart';
import '../entity/post/get_post_parameter.dart';
import '../entity/post/get_post_response.dart';
import '../repository/post_repository.dart';

class GetPost {
  final PostRepository postRepository;

  GetPost({
    required this.postRepository
  });

  Future<LoadDataResult<GetPostResponse>> execute(GetPostParameter getPostParameter) {
    return postRepository.getPost(getPostParameter);
  }
}