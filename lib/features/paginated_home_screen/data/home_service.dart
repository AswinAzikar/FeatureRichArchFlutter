import 'package:FeatureRichArchFlutter/core/api/base_url_constant.dart';
import 'package:FeatureRichArchFlutter/core/api/dio_helper.dart';

class HomeService {
  static Future<List<dynamic>?> getBeerList(int page, int limit) async {
    try {
      final response = await DioHelper().get(
        '/beers',
        type: ApiType.baseUrl,
        queryParameters: {
          'page': page,
          'per_page':
              limit,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load beers: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch beers: $e');
    }
  }
}
