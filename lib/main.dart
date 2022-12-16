import 'package:flutter/material.dart';
import 'package:test_pkp/misc/injector.dart';

import 'presentation/page/post_list_page.dart';

void main() {
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostListPage(),
    );
  }
}