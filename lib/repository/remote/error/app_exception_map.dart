import 'dart:io';

import 'package:sample/repository/remote/error/app_exception.dart';
import 'package:sample/repository/remote/error/exception_map.dart';

class AppExceptionMap implements ExceptionMap {
  @override
  AppException map(Object? error) {
    switch (error) {
      case SocketException:
        throw NotInternet('No Internet connect');
      case RemoteException:
        throw RemoteException(error.toString());
      default:
        throw FetchDataException('Something error: ${error.toString()}');
    }
  }
}
