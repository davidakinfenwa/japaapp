import 'package:dio/dio.dart';

import 'package:japaapp/core/constants.dart';


//TODO: Change the base API HERE

final _options = BaseOptions(
    baseUrl: 'https://otask.ritan360dev.com.ng/api/v1',
    connectTimeout: const Duration(
      seconds: ClientRequestTimeout.kConnectionTimeout,
    ),
    receiveTimeout: const Duration(
      seconds: ClientRequestTimeout.kRecieveTimeout,
    ));

final dioClient = Dio(_options);
