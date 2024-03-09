// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<GitIssues> gitIssuesFromJson(String str) =>
    List<GitIssues>.from(json.decode(str).map((x) => GitIssues.fromJson(x)));

class GitIssues {
  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int id;
  String nodeId;
  int number;
  String title;
  User user;
  List<Label> labels;
  State state;
  bool locked;
  User? assignee;
  List<User> assignees;
  dynamic milestone;
  int comments;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic closedAt;
  AuthorAssociation authorAssociation;
  dynamic activeLockReason;
  String? body;
  Reactions reactions;
  String timelineUrl;
  dynamic performedViaGithubApp;
  String? stateReason;
  bool? draft;
  PullRequest? pullRequest;

  GitIssues({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.assignee,
    required this.assignees,
    required this.milestone,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.authorAssociation,
    required this.activeLockReason,
    required this.body,
    required this.reactions,
    required this.timelineUrl,
    required this.performedViaGithubApp,
    required this.stateReason,
    this.draft,
    this.pullRequest,
  });

  factory GitIssues.fromJson(Map<String, dynamic> json) => GitIssues(
        url: json["url"],
        repositoryUrl: json["repository_url"],
        labelsUrl: json["labels_url"],
        commentsUrl: json["comments_url"],
        eventsUrl: json["events_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        nodeId: json["node_id"],
        number: json["number"],
        title: json["title"],
        user: User.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: stateValues.map[json["state"]]!,
        locked: json["locked"],
        assignee:
            json["assignee"] == null ? null : User.fromJson(json["assignee"]),
        assignees:
            List<User>.from(json["assignees"].map((x) => User.fromJson(x))),
        milestone: json["milestone"],
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"],
        authorAssociation:
            authorAssociationValues.map[json["author_association"]]!,
        activeLockReason: json["active_lock_reason"],
        body: json["body"],
        reactions: Reactions.fromJson(json["reactions"]),
        timelineUrl: json["timeline_url"],
        performedViaGithubApp: json["performed_via_github_app"],
        stateReason: json["state_reason"],
        draft: json["draft"],
        pullRequest: json["pull_request"] == null
            ? null
            : PullRequest.fromJson(json["pull_request"]),
      );
}

class User {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: typeValues.map[json["type"]]!,
        siteAdmin: json["site_admin"],
      );
}

enum Type { USER }

final typeValues = EnumValues({"User": Type.USER});

enum AuthorAssociation { CONTRIBUTOR, MEMBER, NONE }

final authorAssociationValues = EnumValues({
  "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
  "MEMBER": AuthorAssociation.MEMBER,
  "NONE": AuthorAssociation.NONE
});

class Label {
  int id;
  String nodeId;
  String url;
  String name;
  String color;
  bool labelDefault;
  String description;

  Label({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    required this.labelDefault,
    required this.description,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        name: json["name"],
        color: json["color"],
        labelDefault: json["default"],
        description: json["description"],
      );
}

class PullRequest {
  String url;
  String htmlUrl;
  String diffUrl;
  String patchUrl;
  dynamic mergedAt;

  PullRequest({
    required this.url,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
    required this.mergedAt,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
        url: json["url"],
        htmlUrl: json["html_url"],
        diffUrl: json["diff_url"],
        patchUrl: json["patch_url"],
        mergedAt: json["merged_at"],
      );
}

class Reactions {
  String url;
  int totalCount;
  int the1;
  int reactions1;
  int laugh;
  int hooray;
  int confused;
  int heart;
  int rocket;
  int eyes;

  Reactions({
    required this.url,
    required this.totalCount,
    required this.the1,
    required this.reactions1,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        url: json["url"],
        totalCount: json["total_count"],
        the1: json["+1"],
        reactions1: json["-1"],
        laugh: json["laugh"],
        hooray: json["hooray"],
        confused: json["confused"],
        heart: json["heart"],
        rocket: json["rocket"],
        eyes: json["eyes"],
      );
}

enum State { OPEN }

final stateValues = EnumValues({"open": State.OPEN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}



// // models/issue.dart
// class Issue {
//   final int id;
//   final String title;
//   final String body;
//   final User user;
//   final DateTime updatedAt;
//   bool isStarred;

//   Issue({
//     required this.id,
//     required this.title,
//     required this.body,
//     required this.user,
//     required this.updatedAt,
//     this.isStarred = false,
//   });

//   factory Issue.fromJson(Map<String, dynamic> json) {
//     return Issue(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//       user: User.fromJson(json['user']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       isStarred: false, // Assuming isStarred is not included in the API response
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'body': body,
//       'user': user.toJson(),
//       'updated_at': updatedAt.toIso8601String(),
//     };
//   }
// }

// // models/user.dart
// class User {
//   final String login;
//   final String avatarUrl;

//   User({
//     required this.login,
//     required this.avatarUrl,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       login: json['login'],
//       avatarUrl: json['avatar_url'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'login': login,
//       'avatar_url': avatarUrl,
//     };
//   }
// }
