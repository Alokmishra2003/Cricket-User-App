import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static Future<Map<String, dynamic>?> updateUserInfo({
    required String firebaseUid,
    String? name,
    double? weight,
    double? height,
    String? birthDate,
  }) async {
    const String url =
        'https://6c86-2409-40e2-100b-8e4b-98b6-82bf-7321-283a.ngrok-free.app/api/users/updateUser'; // Replace with your endpoint URL

    Map<String, String> headers = {"Content-Type": "application/json"};

    // Create request body with the fields provided
    Map<String, dynamic> body = {
      "firebaseUid": firebaseUid,
      if (name != null) "name": name,
      if (weight != null) "weight": weight,
      if (height != null) "height": height,
      if (birthDate != null) "birthDate": birthDate,
    };

    try {
      // Make the POST request to update user information
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      // If the response status is 200, return the response as a Map
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to update user information');
        return null;
      }
    } catch (e) {
      print('Error updating user information: $e');
      return null;
    }
  }
}