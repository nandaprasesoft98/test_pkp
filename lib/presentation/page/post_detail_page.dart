import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/post/get_post_comment_response.dart';
import '../../domain/entity/post/get_post_response.dart';
import '../../domain/usecase/get_post.dart';
import '../../domain/usecase/get_post_comment.dart';
import '../../misc/errorprovider/error_provider.dart';
import '../../misc/injector.dart';
import '../provider/post_detail_provider.dart';
import '../widget/loaddataresultimplementer/load_data_result_implementer.dart';
import '../widget/post_comment_item.dart';

class PostDetailPage extends StatefulWidget {
  final String postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  State<PostDetailPage> createState() => PostDetailPageState();
}

class PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Detail"),
      ),
      body: ChangeNotifierProvider<PostDetailProvider>(
        create: (_) => PostDetailProvider(
          getPost: Injector.locator<GetPost>(),
          getPostComment: Injector.locator<GetPostComment>(),
          postId: widget.postId
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<PostDetailProvider>(
              builder: (context, postDetailProvider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoadDataResultImplementer<GetPostResponse>(
                      loadDataResult: postDetailProvider.getPostListResponseLoadDataResult,
                      errorProvider: Injector.locator<ErrorProvider>(),
                      onSuccessLoadDataResultWidget: (getPostResponse) => Builder(
                        builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(getPostResponse.post.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(height: 10),
                              Text(getPostResponse.post.body),
                            ],
                          );
                        }
                      )
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    const Text("Comment", style: TextStyle(fontSize: 16)),
                    LoadDataResultImplementer<GetPostCommentResponse>(
                      loadDataResult: postDetailProvider.getPostCommentResponseLoadDataResult,
                      errorProvider: Injector.locator<ErrorProvider>(),
                      onSuccessLoadDataResultWidget: (getPostCommentResponse) => Builder(
                        builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: getPostCommentResponse.postComment.map<Widget>(
                              (postComment) => PostCommentItem(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                postComment: postComment,
                              )
                            ).toList()
                          );
                        }
                      )
                    ),
                  ],
                );
              }
            ),
          )
        )
      )
    );
  }
}