// models/issue.dart
class Issue {
  final int id;
  final String title;
  final String body;
  final User user;
  final DateTime updatedAt;
  bool isStarred;

  Issue({
    required this.id,
    required this.title,
    required this.body,
    required this.user,
    required this.updatedAt,
    this.isStarred = false,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      user: User.fromJson(json['user']),
      updatedAt: DateTime.parse(json['updated_at']),
      isStarred: false, // Assuming isStarred is not included in the API response
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'user': user.toJson(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

// models/user.dart
class User {
  final String login;
  final String avatarUrl;

  User({
    required this.login,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
    };
  }
}
