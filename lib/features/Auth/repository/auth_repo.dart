// import 'dart:convert';

// import 'package:fitness_app/features/Auth/models/createuser_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthRepository {
//   final String apiKey = "http://h3s-developers.site/FitnessApp/public/api";

//   Future<void> createUser(CreateUserModel model) async {
//     final response = await http.post(
//       Uri.parse('$apiKey/users-create'),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(model.toJson()),
//     );
//     print("API Response: ${response.body}");
//     if (response.statusCode == 200) {
//       print("Registration Successfully");
//     } else {
//       throw Exception('failed to register: ${response.body}');
//     }
//   }

//   Future<Map<String, dynamic>> loginUser(String email, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$apiKey/users-login'),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       if (response.statusCode == 200) {
//         final resBody = jsonDecode(response.body);
//         String token = resBody['data']['token'];
//         try {
//           final prefs = await SharedPreferences.getInstance();
//           await prefs.setString('token', token);
//           print('Token saved: $token');
//         } catch (e) {
//           print('Error saving token: $e');
//         }
//         return resBody;
//       } else {
//         throw Exception(
//             "Failed to sign in: ${response.statusCode} - ${response.body}");
//       }
//     } catch (e) {
//       throw Exception("An error occurred during login: $e");
//     }
//   }

//   Future<void> logOut() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');

//       if (token == null) {
//         print("No token found, user already logged out.");
//         return;
//       }

//       final response = await http.post(
//         Uri.parse('$apiKey/users-logout'),
//         headers: {'Authorization': 'Bearer $token'},
//       );

//       if (response.statusCode == 200) {
//         print("User logged out successfully");

//         await prefs.remove('token');
//       } else {
//         print("Failed to log out, status: ${response.statusCode}");
//         print("Response body: ${response.body}");
//       }
//     } catch (e) {
//       throw Exception("Failed to logout: $e");
//     }
//   }
// }
