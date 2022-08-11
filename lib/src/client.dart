import 'dart:convert';
import 'dart:io';

import 'package:desktop_webview_auth/src/auth_result.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static Future<AuthResult> post(String domain, String path, dynamic body) async {
    try {
      final response = await http.post(Uri.parse(domain + path), body: jsonEncode(body));
      if (response.statusCode == 200) {
        return AuthResult.fromJson(jsonDecode(response.body));
      } else {
        throw HttpException(response.reasonPhrase ?? 'Error while proses request');
      }
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
