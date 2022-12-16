import 'package:flutter/material.dart';

import '../../domain/entity/post/post_comment.dart';

class PostCommentItem extends StatelessWidget {
  final PostComment postComment;
  final EdgeInsetsGeometry? padding;

  const PostCommentItem({
    super.key,
    required this.postComment,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    Widget commentWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(postComment.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(postComment.email),
        const SizedBox(height: 5),
        Text(postComment.body),
      ],
    );
    return padding != null ? Padding(padding: padding!, child: commentWidget) : commentWidget;
  }
}