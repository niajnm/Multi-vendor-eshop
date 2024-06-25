import 'package:dio/dio.dart';
import 'package:footwear_customer_app/Helper/ApiBaseHelper.dart';

class DownloadRepository {
  Future<void> downloadFile(
      {required String url,
      required String savePath,
      required CancelToken cancelToken,
      required Function updateDownloadedPercentage}) async {
    try {
      await ApiBaseHelper().downloadFile(
          cancelToken: cancelToken,
          url: url,
          savePath: savePath,
          updateDownloadedPercentage: updateDownloadedPercentage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
