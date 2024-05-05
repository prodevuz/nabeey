import 'dart:async';
// import 'package:http/http.dart' as http;
import 'package:nabeey/data/models/file_model.dart';
import 'package:nabeey/features/explore/models/article_model.dart';
import 'package:nabeey/features/explore/models/category_model.dart';

// class HttpHelper {
//   HttpHelper();

//   final String _baseUrl = "https://api.nabeey.uz";

//   static const String categoryC = 'api/content-categories/create/';
//   static const String categoryR = 'api/content-categories/get-by-id/';
//   static const String categoryU = 'api/content-categories/update/';
//   static const String categoryD = 'api/content-categories/delete/';
//   static const String categoriesR = 'api/content-categories/get-all/';

//   Future<Map<String, dynamic>> get(String endpoint) async {
//     final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
//     return _handleResponse(response);
//   }

//   Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
//     final response = await http.post(
//       Uri.parse('$_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
//     final response = await http.put(
//       Uri.parse('$_baseUrl/$endpoint'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

//   Future<Map<String, dynamic>> delete(String endpoint) async {
//     final response = await http.delete(
//       Uri.parse('$_baseUrl/$endpoint'),
//     );
//     return _handleResponse(response);
//   }

//   Map<String, dynamic> _handleResponse(http.Response response) {
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }

class HttpHelper {
  HttpHelper();

  static const String _baseUrl = "https://api.nabeey.uz";

  static const String categoryC = 'api/content-categories/create/';
  static const String categoryR = 'api/content-categories/get-by-id/';
  static const String categoryU = 'api/content-categories/update/';
  static const String categoryD = 'api/content-categories/delete/';

  static const String categoriesR = 'api/content-categories/get-all/';

  static const String articleC = 'api/articles/create/';
  static const String articleR = 'api/articles/get-by-id/';
  static const String articleU = 'api/articles/update/';
  static const String articleD = 'api/articles/delete/';

  static const String articlesR = 'api/articles/get-all/';

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = Jsons().get('$_baseUrl/$endpoint');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = Jsons().get('$_baseUrl/$endpoint');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    final response = Jsons().get('$_baseUrl/$endpoint');
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = Jsons().get('$_baseUrl/$endpoint');
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Map<String, dynamic> response) {
    if (response['statusCode'] == 200) {
      return response;
    } else {
      throw Exception('Failed to load data: ${response['statusCode']}');
    }
  }
}

class Jsons {
  Jsons();

  static List<Map<String, dynamic>> createCategories() {
    List<Map<String, dynamic>> categories = [];

    for (int i = 1; i <= 4; i++) {
      categories.add(CategoryModel(
              id: i,
              name: 'Kategoriya $i',
              image: FileModel(fileName: 'image-$i', filePath: 'https://picsum.photos/id/$i/350/250'),
              books: [],
              audios: [],
              videos: [],
              articles: [],
              description: "Test uchun kategoriya $i")
          .toJson());
    }
    return categories;
  }

  static List<Map<String, dynamic>> createArticles() {
    List<Map<String, dynamic>> articles = [];

    for (int i = 1; i <= 4; i++) {
      articles.add(ArticleModel(
        id: i,
        image: FileModel(fileName: 'image-$i', filePath: 'https://picsum.photos/id/$i/350/250'),
        category: CategoryModel.fromJson(Jsons.createCategories()[1]),
        text: "This is text of article.",
      ).toJson());
    }
    return articles;
  }

  Map<String, dynamic> get(String uri) => jsons[uri]!;

  Map<String, Map<String, dynamic>> jsons = {
    "${HttpHelper._baseUrl}/${HttpHelper.categoryC}": {
      "statusCode": 200,
      "message": "Successful",
      "data": Jsons.createCategories()[0],
    },
    "${HttpHelper._baseUrl}/${HttpHelper.categoryR}1": {
      "statusCode": 200,
      "message": "Successful",
      "data": Jsons.createCategories()[0],
    },
    "https://api.nabeey.uz/api/content-categories/update/": {},
    "https://api.nabeey.uz/api/content-categories/delete/": {"": ""},
    "${HttpHelper._baseUrl}/${HttpHelper.categoriesR}": {
      "statusCode": 200,
      "message": "Successful",
      "data": [Jsons.createCategories()[0], Jsons.createCategories()[1], Jsons.createCategories()[2], Jsons.createCategories()[3]],
    },
    "${HttpHelper._baseUrl}/${HttpHelper.articleC}": {
      "statusCode": 200,
      "message": "Successful",
      "data": Jsons.createArticles()[0],
    },
    "${HttpHelper._baseUrl}/${HttpHelper.articleR}": {
      "statusCode": 200,
      "message": "Successful",
      "data": Jsons.createArticles()[0],
    },
    "${HttpHelper._baseUrl}/${HttpHelper.articleU}": {},
    "${HttpHelper._baseUrl}/${HttpHelper.articleD}": {"": ""},
    "${HttpHelper._baseUrl}/${HttpHelper.articlesR}": {
      "statusCode": 200,
      "message": "Successful",
      "data": [Jsons.createArticles()[0], Jsons.createArticles()[1], Jsons.createArticles()[2], Jsons.createArticles()[3]],
    },
  };
}
