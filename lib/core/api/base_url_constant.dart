//add multiple base urls if needed
enum ApiType { base, coffee,baseUrl, product }

class BaseUrlConstant {
  static const String base = 'https://jsonplaceholder.typicode.com';
  static const String coffee = 'https://api.sampleapis.com';
  static const String baseUrl = 'https://api.punkapi.com/v2';
  static const String product='https://dummyjson.com';

  static String getBaseUrl(ApiType type) {
    switch (type) {
      case ApiType.base:
        return base;
      case ApiType.coffee:
        return coffee;
      case ApiType.baseUrl:
        return baseUrl;
      case ApiType.product:
        return product;   
    }
  }
}
