import 'dart:io';
import 'package:http/http.dart' as http;
import '../domain/posts/models/post.dart';

class RemoteService {
  Future<List<Post>> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return [];
  }
}