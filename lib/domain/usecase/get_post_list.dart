import '../../misc/load_data_result.dart';
import '../entity/post/get_post_list_parameter.dart';
import '../entity/post/get_post_list_response.dart';
import '../repository/post_repository.dart';

class GetPostList {
  final PostRepository postRepository;

  GetPostList({
    required this.postRepository
  });

  Future<LoadDataResult<GetPostListResponse>> execute(GetPostListParameter getPostListParameter) {
    return postRepository.getPostList(getPostListParameter);
  }
}