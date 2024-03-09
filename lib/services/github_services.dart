import 'package:github_track/models/issues.dart';
import 'package:http/http.dart' as http;

class GitHubRepo {
  static Future<dynamic> fetchGitIssues() async {
    try {
      final url =
          Uri.parse("https://api.github.com/repos/flutter/flutter/issues");
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final data = gitIssuesFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("Error Occured");
      return null;
    }
  }
}
