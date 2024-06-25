import 'dart:core';
import 'package:footwear_customer_app/Helper/ApiBaseHelper.dart';
import 'package:footwear_customer_app/Model/searchedSeller.dart';
import '../Helper/Constant.dart';
import '../Helper/String.dart';

class SellerDetailRepository {
  ///This method is used to getseller
  static Future<Map<String, dynamic>> fetchSeller({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var result = await ApiBaseHelper().postAPICall(getSellerApi, parameter);

      return result;
    } on Exception catch (e) {
      throw ApiException('$errorMesaage${e.toString()}');
    }
  }

  //Api to search the seller.. User can searc hthe seller and send message to seller
  Future<List<SearchedSeller>> searchSeller({
    required Map<String, dynamic> parameter,
  }) async {
    try {
      var result =
          await ApiBaseHelper().postAPICall(searchSellerApi, parameter);

      if (result['error']) {
        print(result);
        throw ApiException(result['message'] ?? 'Failed to get sellers');
      }

      return ((result['data'] ?? []) as List)
          .map((seller) => SearchedSeller.fromJson(Map.from(seller ?? {})))
          .toList();
    } on Exception catch (e) {
      throw ApiException(e.toString());
    }
  }
}
