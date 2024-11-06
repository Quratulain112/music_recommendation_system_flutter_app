import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'https://zohaibanwer.pythonanywhere.com/api/';

class ApiService {
  static Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}auth/login/'),
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['key'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return true;
    }
    return false;
  }

  static Future<bool> register(
      String username, String password1, String password2) async {
    final response = await http.post(
      Uri.parse('${baseUrl}auth/registration/'),
      body: {
        'username': username,
        'password1': password1,
        'password2': password2,
      },
    );
    return response.statusCode == 204;
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      await http.post(
        Uri.parse('${baseUrl}auth/logout/'),
        headers: {'Authorization': 'Token $token'},
      );
      await prefs.remove('token');
    }
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  static Future<List<Map<String, dynamic>>> fetchSongsByPrompt(
      String prompt) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception("No authentication token found.");
    }

    final response = await http.post(
      Uri.parse('${baseUrl}prompt/'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'prompt': prompt}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    }
    throw Exception("Failed to fetch songs: ${response.reasonPhrase}");
  }

  static Future<List<Map<String, dynamic>>> fetchFavoritesFromApi() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      throw Exception("No authentication token found.");
    }

    final response = await http.get(
      Uri.parse('${baseUrl}favorites/'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    }
    throw Exception("Failed to fetch favorites: ${response.reasonPhrase}");
  }

  static Future<bool> addFavorite(String trackId, String trackName) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      throw Exception("No authentication token found.");
    }
    final response = await http.post(
      Uri.parse('${baseUrl}favorites/add/'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'track_id': trackId,
        'track_name': trackName,
      }),
    );
    return response.statusCode == 201;
  }

  static Future<bool> removeFavorite(String trackId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      final response = await http.delete(
        Uri.parse('${baseUrl}favorites/remove/$trackId/'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );
      return response.statusCode == 200;
    } else {
      throw Exception("No authentication token found.");
    }
  }

  static Future<List<Map<String, dynamic>>> fetchDiscoverSongs({
    required int page,
    String? filter,
    String? year,
    String? artist,
    String? genre,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      final response = await http.get(
        Uri.parse(
            '${baseUrl}discover/?page=$page&filter=$filter&year=$year&artist=$artist&genre=$genre'),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['songs']);
      } else {
        throw Exception("Failed to fetch songs: ${response.reasonPhrase}");
      }
    } else {
      throw Exception("No authentication token found.");
    }
  }
}