import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasource/postdatasource/default_post_data_source.dart';
import '../data/datasource/postdatasource/post_data_source.dart';
import '../data/datasource/userdatasource/default_user_data_source.dart';
import '../data/datasource/userdatasource/user_data_source.dart';
import '../data/repository/default_post_repository.dart';
import '../data/repository/default_user_repository.dart';
import '../domain/repository/post_repository.dart';
import '../domain/repository/user_repository.dart';
import '../domain/usecase/create_post.dart';
import '../domain/usecase/delete_post.dart';
import '../domain/usecase/edit_post.dart';
import '../domain/usecase/get_post.dart';
import '../domain/usecase/get_post_comment.dart';
import '../domain/usecase/get_post_list.dart';
import '../domain/usecase/get_user_list.dart';
import 'defaultloaddataresultwidget/default_load_data_result_widget.dart';
import 'defaultloaddataresultwidget/main_default_load_data_result_widget.dart';
import 'errorprovider/default_error_provider.dart';
import 'errorprovider/error_provider.dart';
import 'http_client.dart';

class _Injector {
  final GetIt locator = GetIt.instance;

  void init() {
    // Error Provider
    locator.registerLazySingleton<ErrorProvider>(() => DefaultErrorProvider());

    // Default Load Data Result Widget
    locator.registerLazySingleton<DefaultLoadDataResultWidget>(() => MainDefaultLoadDataResultWidget());

    // Use Case
    locator.registerLazySingleton<GetPost>(() => GetPost(postRepository: locator()));
    locator.registerLazySingleton<GetPostList>(() => GetPostList(postRepository: locator()));
    locator.registerLazySingleton<GetPostComment>(() => GetPostComment(postRepository: locator()));
    locator.registerLazySingleton<CreatePost>(() => CreatePost(postRepository: locator()));
    locator.registerLazySingleton<EditPost>(() => EditPost(postRepository: locator()));
    locator.registerLazySingleton<DeletePost>(() => DeletePost(postRepository: locator()));
    locator.registerLazySingleton<GetUserList>(() => GetUserList(userRepository: locator()));

    // Repository
    locator.registerLazySingleton<PostRepository>(() => DefaultPostRepository(postDataSource: locator()));
    locator.registerLazySingleton<UserRepository>(() => DefaultUserRepository(userDataSource: locator()));

    // Data Sources
    locator.registerLazySingleton<PostDataSource>(() => DefaultPostDataSource(dio: locator()));
    locator.registerLazySingleton<UserDataSource>(() => DefaultUserDataSource(dio: locator()));

    // Dio
    locator.registerLazySingleton<Dio>(() => DioHttpClient.of());
  }
}

// ignore: non_constant_identifier_names
final Injector = _Injector();