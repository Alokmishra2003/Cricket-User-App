import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static const String baseUrl =
      'https://6c86-2409-40e2-100b-8e4b-98b6-82bf-7321-283a.ngrok-free.app/api/users'; // Replace with your actual base URL

  // Method to get user by Firebase UID
  static Future<Map<String, dynamic>?> getUser(String firebaseUid) async {
    final String url = '$baseUrl/user/$firebaseUid';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        return responseData['user'];
      } else {
        print('Failed to load user data: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
