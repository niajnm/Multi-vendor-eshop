import 'dart:core';
import 'package:footwear_customer_app/Helper/ApiBaseHelper.dart';
import '../Helper/String.dart';
import '../Helper/Constant.dart';

class SingleProductRepository {
  ///This method is used to getfav
  static Future<dynamic> getProduct({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var result = await ApiBaseHelper().postAPICall(getProductApi, parameter);
      return result;
    } on Exception catch (e) {
      throw ApiException('$errorMesaage${e.toString()}');
    }
  }
}
