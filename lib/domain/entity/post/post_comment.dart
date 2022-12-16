class PostComment {
  String id;
  String postId;
  String name;
  String email;
  String body;

  PostComment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PostComment &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              postId == other.postId &&
              name == other.name &&
              email == other.email &&
              body == other.body;

  @override
  int get hashCode =>
      id.hashCode ^
      postId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
}