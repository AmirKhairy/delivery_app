import 'package:dio/dio.dart';

class AppDioError implements Exception {
  late String message;

  AppDioError.fromDioError(DioException dioError) {
    print("dioErrorrrrrrrrrrr");
    print(dioError.message);
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionError:
        message = "Connection error with API server";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        print("BAAAAAAAAAAD");
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        print("IM HERE 400 ${error["msg"]}");
        return error["msg"];
      case 401:
        print("IM HERE 401 ${error["msg"]}");
        return error["msg"];
      case 403:
        print("IM HERE 403 ${error["msg"]}");
        return error["msg"];
      case 404:
        print("IM HERE 404 ${error["msg"]}");
        return error["msg"];
      case 422:
        print("IM HERE 422 ${error["data"][0]["message"]}");
        return error["msg"];
      case 500:
        print("IM HERE 500 ${error["msg"]}");
        return error["msg"];
      case 502:
        print("IM HERE 502 ${error["msg"]}");
        return error["msg"];
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
