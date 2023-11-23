import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../model/upload/upload_model.dart';
import '../../../utils/common/data.dart';
import '../../setup_dio/dio_setup.dart';
import '../../url.dart';

class UploadImageAPI {
  static Future<UploadModel> post({required String base64}) async {
    try {
      // final fileName = file.path.split('/').last;
      //
      // final formData = FormData.fromMap({
      //   'File': await MultipartFile.fromFile(
      //     file.path,
      //     filename: fileName,
      //   ),
      //   'Type': type
      // });

      var response = await DioClient(Dio())
          .post(SubAPI.uploadImage, data: {'imgUrl': base64});

      if (kDebugMode) {
        print(
            '******** Status Call API Upload Image: ${response.statusCode} ********');
      }

      if (response.statusCode == 200) {
        return uploadModelFromJson(jsonEncode(response.data));
      }

      return UploadModel();
    } catch (e) {
      if (kDebugMode) {
        print('******TRY-CATCH Error Call API Update Image: $e');
      }

      return UploadModel();
    }
  }
}
