import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/post/edit_post_parameter.dart';
import '../../domain/entity/post/get_post_response.dart';
import '../../domain/entity/user/get_user_list_response.dart';
import '../../domain/entity/user/user.dart';
import '../../domain/usecase/edit_post.dart';
import '../../domain/usecase/get_post.dart';
import '../../domain/usecase/get_user_list.dart';
import '../../misc/errorprovider/error_provider.dart';
import '../../misc/injector.dart';
import '../../misc/load_data_result.dart';
import '../provider/edit_post_provider.dart';
import '../widget/loaddataresultimplementer/load_data_result_implementer.dart';

class EditPostPage extends StatefulWidget {
  final String postId;

  const EditPostPage({super.key, required this.postId});

  @override
  State<EditPostPage> createState() => EditPostPageState();
}

class EditPostPageState extends State<EditPostPage> {
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Post"),
      ),
      body: ChangeNotifierProvider<EditPostProvider>(
        create: (_) => EditPostProvider(
          editPost: Injector.locator<EditPost>(),
          getPost: Injector.locator<GetPost>(),
          getUserList: Injector.locator<GetUserList>(),
          postId: widget.postId,
          onGetPostResponse: (getPostResponse) {
            _titleTextEditingController.text = getPostResponse.post.title;
            _bodyTextEditingController.text = getPostResponse.post.body;
          }
        ),
        child: Consumer<EditPostProvider>(
          builder: (context, editPostNotifier, _) => LoadDataResultImplementer<GetPostResponse>(
            loadDataResult: editPostNotifier.getPostListResponseLoadDataResult,
            errorProvider: Injector.locator<ErrorProvider>(),
            onSuccessLoadDataResultWidget: (getPostResponse) => Builder(
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("User"),
                        LoadDataResultImplementer<GetUserListResponse>(
                          loadDataResult: editPostNotifier.getUserListResponseLoadDataResult,
                          errorProvider: Injector.locator<ErrorProvider>(),
                          onSuccessLoadDataResultWidget: (getUserListResponse) {
                            List<User> userList = getUserListResponse.userList;
                            return DropdownButton<User>(
                              items: userList.map<DropdownMenuItem<User>>((user) => DropdownMenuItem(
                                value: user,
                                child: Text(user.name)
                              )).toList(),
                              onChanged: (user) => setState(() => editPostNotifier.selectedUser = user),
                              value: editPostNotifier.selectedUser,
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        const Text("Title"),
                        TextField(
                          controller: _titleTextEditingController
                        ),
                        const SizedBox(height: 10),
                        const Text("Body"),
                        TextField(
                          controller: _bodyTextEditingController
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: editPostNotifier.getUserListResponseLoadDataResult is SuccessLoadDataResult<GetUserListResponse> ? () => editPostNotifier.processEditPost(
                            editPostParameter: EditPostParameter(
                              postId: widget.postId,
                              userId: editPostNotifier.selectedUser != null ? editPostNotifier.selectedUser!.id : "",
                              title: _titleTextEditingController.text,
                              body: _bodyTextEditingController.text
                            ),
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
                            successEditPost: (editPostResponse) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            failedEditPost: (e) => Scaffold.of(context).showBottomSheet((context) => Text(e.toString()))
                          ) : null,
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).colorScheme.primary,
                          ),
                          child: const Text("Edit"),
                        )
                      ]
                    )
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