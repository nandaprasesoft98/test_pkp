import '../../misc/load_data_result.dart';
import '../entity/post/edit_post_parameter.dart';
import '../entity/post/edit_post_response.dart';
import '../repository/post_repository.dart';

class EditPost {
  final PostRepository postRepository;

  EditPost({
    required this.postRepository
  });

  Future<LoadDataResult<EditPostResponse>> execute(EditPostParameter editPostParameter) {
    return postRepository.editPost(editPostParameter);
  }
}