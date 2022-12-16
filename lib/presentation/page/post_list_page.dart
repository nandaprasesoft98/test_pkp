import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pkp/misc/ext/load_data_result_ext.dart';

import '../../domain/entity/post/delete_post_parameter.dart';
import '../../domain/entity/post/get_post_list_response.dart';
import '../../domain/entity/post/post.dart';
import '../../domain/usecase/delete_post.dart';
import '../../domain/usecase/get_post_list.dart';
import '../../misc/errorprovider/error_provider.dart';
import '../../misc/injector.dart';
import '../provider/post_list_provider.dart';
import '../widget/loaddataresultimplementer/load_data_result_implementer.dart';
import '../widget/post_item.dart';
import 'create_post_page.dart';
import 'edit_post_page.dart';
import 'post_detail_page.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const CreatePostPage();
                  }
                )
              );
            }
          )
        ],
      ),
      body: ChangeNotifierProvider<PostListProvider>(
        create: (_) => PostListProvider(
          getPostList: Injector.locator<GetPostList>(),
          deletePost: Injector.locator<DeletePost>()
        ),
        child: Consumer<PostListProvider>(
          builder: (context, postListNotifier, widget) => LoadDataResultImplementer<GetPostListResponse>(
            loadDataResult: postListNotifier.getPostListResponseLoadDataResult,
            errorProvider: Injector.locator<ErrorProvider>(),
            onSuccessLoadDataResultWidget: (getPostResponse) => Builder(
              builder: (context) {
                List<Post> postList = getPostResponse.postList;
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) => PostItem(
                    post: postList[index],
                    onTapForDetail: (post) async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return PostDetailPage(postId: post.id);
                          }
                        )
                      );
                      postListNotifier.processUpdatePost();
                    },
                    onTapForEditing: (post) async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return EditPostPage(postId: post.id);
                          }
                        )
                      );
                      postListNotifier.processUpdatePost();
                    },
                    onDelete: (post) => postListNotifier.processDeletePost(
                      deletePostParameter: DeletePostParameter(postId: post.id),
                        showLoading: () => showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Center(child: CircularProgressIndicator())
                                ]
                              )
                            )
                          )
                        ),
                        successDeletePost: (editPostResponse) {
                          Navigator.of(context).pop();
                        },
                        failedDeletePost: (e) => Scaffold.of(context).showBottomSheet((context) => Text(e.toString()))
                    ),
                  )
                );
              }
            ),
          )
        ),
      )
    );
  }
}