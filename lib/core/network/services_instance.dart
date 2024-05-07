// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/network/network.dart';
import 'package:japaapp/domain/form_params/form_params.dart';




class Services {
   final ExceptionMapper _exceptionMapper;
  Services({
   required ExceptionMapper exceptionMapper
  }):_exceptionMapper=exceptionMapper;
   

 Future<Response> post({
  required String uri,
       required data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        String? authorization
      }) async {
   try {
      final response = await dioClient.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
        headers: {
          'Authorization': authorization,
          "content-type": "application/json",
          "Accept": "application/json"
        },
        )
      ).timeout(Duration(seconds: 60));

     return response;
    } on DioException catch (e) {
      print (e.response?.data);
      throw _exceptionMapper.mapException(e);
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
   
   
  }



   Future<Response> get( {
     required String uri,
       //required data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
         String? authorization
      }) async {
   try {
      final response = await dioClient.get(
        uri,
        queryParameters: queryParameters,
        options: Options(
        headers: {
          'Authorization': authorization,
          "content-type": "application/json",
          "Accept": "application/json"
        },
        )

      ).timeout(Duration(seconds: 60));

     return response;
    } on DioException catch (e) {

      throw _exceptionMapper.mapException(e);
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
   
   
  }




  Future<Response> download(
      String uri, path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        bool deleteOnError = true,
      }) async {
    try {
      var response = await dioClient.download(
        uri,
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        deleteOnError: deleteOnError,
        
      ).timeout(Duration(seconds: 60));
      return response;
    } on DioException catch (e) {

      throw _exceptionMapper.mapException(e);
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dioClient.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ).timeout(Duration(seconds: 60));
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
     {
         required String uri,
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dioClient.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ).timeout(Duration(seconds: 60));
      return response;
   } on DioException catch (e) {

      throw _exceptionMapper.mapException(e);
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
       {
        required String uri,
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
        String? authorization
      }) async {
    try {
      var response = await dioClient.delete(
        uri,
        queryParameters: queryParameters,
      
        cancelToken: cancelToken,
        data: data,
         options: Options(
        headers: {
          'Authorization': authorization,
          "content-type": "application/json",
          "Accept": "application/json"
        },
        )
      ).timeout(Duration(seconds: 60));
      return response;
    } on DioException catch (e) {

      throw _exceptionMapper.mapException(e);
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
 



Future<Response> uploadMultipleFile({
  required String url,
  Map<String, String>? data,
  Map<String, String>? uploadFiles,
  
}) async {
  

  final formData = FormData();
  if (data != null) {
   data.forEach((key, value) {
      formData.files.add(MapEntry(key, MultipartFile.fromString(value)));
    });
  }

  if (uploadFiles != null) {
    for (final entry in uploadFiles.entries) {
      final file = await MultipartFile.fromFile(entry.value, filename: entry.key);
      formData.files.add(MapEntry(entry.key, file));
    }
  }

  try {
    final response = await dioClient.post(
      url,
      data: formData,
      
    ).timeout(Duration(seconds: 60));
    return response;
   } on DioException catch (e) {

      throw _exceptionMapper.mapException(e);
    }
    on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
}

Future<Response> uploadFile({
  required String url,
  dynamic data,
  File? uploadFile,
  Options? options,
  String? authorization
}) async {
  print(data);

  final formData = FormData();

  if (data != null && data is BasicInformationFormParams) {
    // Convert data to Map<String, dynamic>
    final basicInformationMap = data.toJson();

    // Add the single data field to formData
    basicInformationMap.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });
  } else {
    throw ArgumentError('Invalid data type. Expected BasicInformationFormParams.');
  }

  // Add the file to formData
  if (uploadFile != null) {
    final file = await MultipartFile.fromFile(uploadFile.path);
    formData.files.add(MapEntry('image', file)); // Specify field name as 'file'
  }

  try {
    final response = await dioClient.post(
      url,
      data: formData,
      options: Options(
        headers: {
          'Authorization': authorization,
          "content-type": "application/json",
          "Accept": "application/json"
        },
      ),
    ).timeout(Duration(seconds: 60));
    return response;
  } on DioError catch (e) {
    throw _exceptionMapper.mapException(e);
  } on SocketException catch (e) {
    throw SocketException(e.toString());
  } on FormatException catch (_) {
    throw FormatException("Unable to process the data");
  } catch (e) {
    // Catch any other exception and rethrow
    rethrow;
  }
}

  // Future<Response> upload({
  //   required String url,
  //   Map<String, String>? body,
  //   Map<String, String>? uploadFiles,
  //   Map<String, String>? headerMap,
  // }) async {
  //   Uri apiUrl = Uri.parse(url);
    
  //    final userToken = await TokenService().retrieveToken();
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer Bearer $userToken',
  //       'Accept': 'application/json; charset=UTF-8'
  //   };

  //   try {
  //     http.MultipartRequest apiResponse = http.MultipartRequest('POST', apiUrl);
  //     apiResponse.headers.addAll(headers);
  //     printData('identifier', uploadFiles!.entries);

  //     List<Future<http.MultipartFile>> futures = uploadFiles.entries
  //         .map((i) async => await http.MultipartFile.fromPath(
  //               '${i.key}',
  //               '${i.value}',
  //             ))
  //         .toList();
  //     final filesList = [for (final future in futures) await future];
  //     apiResponse.files.addAll(filesList);
  //     apiResponse.fields.addAll(body!);
  //     http.StreamedResponse apiRes = await apiResponse.send();
  //     http.Response response = await http.Response.fromStream(apiRes);
      
  //     return response;
  //   } on SocketException catch (_) {
  //     throw 'Kindly, check your internet connection.';
  //   } on TimeoutException catch (_) {
  //     throw 'Request Timeout.';
  //   } on FormatException catch (_) {
  //     throw 'error occured, please try again later.';
  //   } catch (e) {
  //     throw '$e';
  //   }
  // }

  
  
}
