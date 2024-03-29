// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/network/network.dart';



class Services {
   final ExceptionMapper _exceptionMapper;
  Services({
   required ExceptionMapper exceptionMapper
  }):_exceptionMapper=exceptionMapper;
   

 Future<Response> post(String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
   try {
      final response = await dioClient.post(
        uri,
        data: data,
        queryParameters: queryParameters,
      );

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



   Future<Response> get(String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
   try {
      final response = await dioClient.get(
        uri,
        queryParameters: queryParameters,
      );

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
      );
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
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
      String uri, {
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
      );
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
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dioClient.delete(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        data: data,
      );
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
      
    );
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
