
import 'package:e_commerce/core/constants/app_urls.dart';

class ImageDisplayHelper {
  
 static String generateCategoryImageURL(String title) {
    return AppUrl.categoryImage + title + AppUrl.alt;
  }

  static String generateProductImageURL(String title) {
    return AppUrl.productImage + title + AppUrl.alt;
  }
}

//AppUrl.categoryImage + title + AppUrl.alt;