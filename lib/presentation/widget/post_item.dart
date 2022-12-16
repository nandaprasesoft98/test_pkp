import 'package:flutter/material.dart';

import '../../domain/entity/post/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final void Function(Post)? onTapForDetail;
  final void Function(Post)? onTapForEditing;
  final void Function(Post)? onDelete;

  const PostItem({
    super.key,
    required this.post,
    required this.onTapForDetail,
    required this.onTapForEditing,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTapForDetail != null ? () => onTapForDetail!(post) : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(post.body)
                  ]
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onTapForEditing != null ? () => onTapForEditing!(post) : null,
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete != null ? () => onDelete!(post) : null,
              )
            ]
          )
        ),
      ),
    );
  }
}