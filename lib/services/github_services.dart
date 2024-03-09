import 'package:github_track/models/issues.dart';
import 'package:http/http.dart' as http;

class GitHubRepo {
  static Future<dynamic> fetchGitIssues() async {
    try {
      final url =
          Uri.parse("https://api.github.com/repos/flutter/flutter/issues");
      final response = await http.get(url);

      // Check for rate limit headers
      final rateLimitLimit =
          int.tryParse(response.headers['x-ratelimit-limit'] ?? '');
      final rateLimitRemaining =
          int.tryParse(response.headers['x-ratelimit-remaining'] ?? '');
      final rateLimitReset =
          int.tryParse(response.headers['x-ratelimit-reset'] ?? '');

      print("Rate Limit Limit: $rateLimitLimit");
      print("Rate Limit Remaining: $rateLimitRemaining");
      print("Rate Limit Reset: $rateLimitReset");

      if (rateLimitRemaining != null && rateLimitRemaining == 0) {
        // Handle rate limit exceeded, wait until rate limit reset time
        await Future.delayed(Duration(seconds: rateLimitReset as int));
        // Retry the request
        return fetchGitIssues();
      }

      if (response.statusCode == 200) {
        final data = gitIssuesFromJson(response.body);
        return data;
      }
    } catch (e) {
      print("Error Occurred: $e");
      return null;
    }
  }
}
