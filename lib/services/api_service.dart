import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart'; 

class ApiService {
  
  static Future<List<News>> fetchList(String category) async {
    final response = await http.get(Uri.parse('https://api.spaceflightnewsapi.net/v4/$category'));

    if (response.statusCode == 200) {
      List<dynamic> results = json.decode(response.body)['results'];
      return results.map((item) => News.fromJson(item)).toList();  
    } else {
      throw Exception('Failed to load data');
    }
  }

  
  static Future<News> fetchDetail(String category, int id) async {
    final response = await http.get(Uri.parse('https://api.spaceflightnewsapi.net/v4/$category/$id'));

    if (response.statusCode == 200) {
      return News.fromJson(json.decode(response.body)); 
    } else {
      throw Exception('Failed to load detail');
    }
  }
}
