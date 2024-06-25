import 'package:footwear_customer_app/Helper/ApiBaseHelper.dart';
import 'package:footwear_customer_app/Helper/Constant.dart';
import 'package:footwear_customer_app/Helper/String.dart';
import 'package:footwear_customer_app/Model/brandModel.dart';

class BrandsRepository {
  Future<List<BrandData>> getAllBrands() async {
    try {
      var responseData = await ApiBaseHelper().postAPICall(getBrandsApi, {});
      return responseData['data']
          .map<BrandData>((e) => BrandData.fromJson(e))
          .toList();
    } on Exception catch (e) {
      throw ApiException('$errorMesaage${e.toString()}');
    }
  }
}
