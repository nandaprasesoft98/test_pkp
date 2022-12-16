import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/post/create_post_parameter.dart';
import '../../domain/entity/user/get_user_list_response.dart';
import '../../domain/entity/user/user.dart';
import '../../domain/usecase/create_post.dart';
import '../../domain/usecase/get_post.dart';
import '../../domain/usecase/get_user_list.dart';
import '../../misc/errorprovider/error_provider.dart';
import '../../misc/injector.dart';
import '../../misc/load_data_result.dart';
import '../provider/create_post_provider.dart';
import '../widget/loaddataresultimplementer/load_data_result_implementer.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => CreatePostPageState();
}

class CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _bodyTextEditingController = TextEditingController();
  User? _selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: ChangeNotifierProvider<CreatePostProvider>(
        create: (_) => CreatePostProvider(
          createPost: Injector.locator<CreatePost>(),
          getPost: Injector.locator<GetPost>(),
          getUserList: Injector.locator<GetUserList>()
        ),
        child: Consumer<CreatePostProvider>(
          builder: (context, createPostNotifier, _) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("User"),
                  LoadDataResultImplementer<GetUserListResponse>(
                    loadDataResult: createPostNotifier.getUserListResponseLoadDataResult,
                    errorProvider: Injector.locator<ErrorProvider>(),
                    onSuccessLoadDataResultWidget: (getUserListResponse) {
                      List<User> userList = getUserListResponse.userList;
                      return DropdownButton<User>(
                        items: userList.map<DropdownMenuItem<User>>((user) => DropdownMenuItem(
                          value: user,
                          child: Text(user.name)
                        )).toList(),
                        onChanged: (user) => setState(() => _selectedUser = user),
                        value: _selectedUser,
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
                    onPressed: createPostNotifier.getUserListResponseLoadDataResult is SuccessLoadDataResult<GetUserListResponse> ? () => createPostNotifier.processCreatePost(
                      createPostParameter: CreatePostParameter(
                        userId: _selectedUser != null ? _selectedUser!.id : "",
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
                      successCreatePost: (createPostResponse) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      failedCreatePost: (e) => Scaffold.of(context).showBottomSheet((context) => Text(e.toString()))
                    ) : null,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text("Create"),
                  )
                ]
              )
            )
          )
        ),
      )
    );
  }
}