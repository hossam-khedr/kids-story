import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/api_constants.dart';


class DioHelper {
  static late Dio dio;


  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: kIsWeb ? null : const Duration(seconds: 5),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );


    dio.interceptors.add(ApiInterceptor());


    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (object) {
            debugPrint('🌐 API Log: $object');
          },
        ),
      );
    }
  }

  // GET Request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
  }) async {
    try {

      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }


      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      final response = await dio.get(
        url,
        queryParameters: query,
      );
      return response;
    } catch (error) {
      debugPrint('❌ GET Request Error: $error');
      rethrow;
    }
  }

  // POST Request
 static  Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
  }) async {
    try {
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }

      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      final response = await dio.post(
        url,
        data: data,
        queryParameters: query,
      );
      return response;
    } catch (error) {
      debugPrint('❌ POST Request Error: $error');
      rethrow;
    }
  }

  // PUT Request
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
  }) async {
    try {
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }

      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      final response = await dio.put(
        url,
        data: data,
        queryParameters: query,
      );
      return response;
    } catch (error) {
      debugPrint('❌ PUT Request Error: $error');
      rethrow;
    }
  }

  // DELETE Request
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
    Map<String, String>? headers,
  }) async {
    try {
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }

      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      final response = await dio.delete(
        url,
        data: data,
        queryParameters: query,
      );
      return response;
    } catch (error) {
      debugPrint('❌ DELETE Request Error: $error');
      rethrow;
    }
  }


  static Future<Response> uploadFile({
    required String url,
    required String filePath,
    required String fieldName,
    Map<String, dynamic>? data,
    String? token,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }

      FormData formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
        if (data != null) ...data,
      });

      final response = await dio.post(
        url,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (error) {
      debugPrint('❌ Upload File Error: $error');
      rethrow;
    }
  }


  static void cancelAllRequests() {
    dio.close();
  }
}


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('🚀 Request: ${options.method} ${options.uri}');

    // يمكنك إضافة logic هنا لإضافة token من SharedPreferences مثلاً
    // String? token = CacheHelper.getData(key: 'token');
    // if (token != null && token.isNotEmpty) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('✅ Response: ${response.statusCode} ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('❌ Error: ${err.response?.statusCode} ${err.requestOptions.uri}');


    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        debugPrint('⏰ Connection Timeout Error');
        break;
      case DioExceptionType.sendTimeout:
        debugPrint('⏰ Send Timeout Error');
        break;
      case DioExceptionType.receiveTimeout:
        debugPrint('⏰ Receive Timeout Error');
        break;
      case DioExceptionType.badResponse:
        _handleBadResponse(err);
        break;
      case DioExceptionType.cancel:
        debugPrint('❌ Request was cancelled');
        break;
      case DioExceptionType.unknown:
        debugPrint('🌐 Network Error - Check your internet connection');
        break;
      case DioExceptionType.badCertificate:
        debugPrint('🔒 Certificate Error');
        break;
      case DioExceptionType.connectionError:
        debugPrint('🌐 Connection Error');
        break;
    }

    super.onError(err, handler);
  }

  void _handleBadResponse(DioException err) {
    switch (err.response?.statusCode) {
      case 400:
        debugPrint('❌ Bad Request - البيانات غير صحيحة');
        break;
      case 401:
        debugPrint('🔐 Unauthorized - غير مصرح له');

        // navigateToLogin();
        break;
      case 403:
        debugPrint('🚫 Forbidden - ممنوع الوصول');
        break;
      case 404:
        debugPrint('🔍 Not Found - غير موجود');
        break;
      case 500:
        debugPrint('🔥 Internal Server Error - خطأ في الخادم');
        break;
      case 503:
        debugPrint('🛠️ Service Unavailable - الخدمة غير متاحة');
        break;
      default:
        debugPrint('❌ Error: ${err.response?.statusCode}');
    }
  }
}

// helper class لمعالجة الأخطاء وإرجاع رسائل مفهومة
// class ApiErrorHandler {
//   static dynamic getMessage(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         return Failure(message: 'انتهت مهلة الاتصال، يرجى المحاولة مرة أخرى');
//       case DioExceptionType.sendTimeout:
//         return Failure(message: 'انتهت مهلة إرسال البيانات، يرجى المحاولة مرة أخرى');
//       case DioExceptionType.receiveTimeout:
//         return Failure(message: 'انتهت مهلة استلام البيانات، يرجى المحاولة مرة أخرى');
//       case DioExceptionType.badResponse:
//         return _handleStatusCode(error.response?.statusCode);
//       case DioExceptionType.cancel:
//         return Failure(message: 'تم إلغاء الطلب');
//       case DioExceptionType.unknown:
//         return Failure(message: 'تحقق من اتصالك بالإنترنت وحاول مرة أخرى');
//       case DioExceptionType.badCertificate:
//         return Failure(message: 'خطأ في شهادة الأمان');
//       case DioExceptionType.connectionError:
//         return Failure(message: 'خطأ في الاتصال، تحقق من الإنترنت');
//     }
//  }

  // static String _handleStatusCode(int? statusCode) {
  //   switch (statusCode) {
  //     case 400:
  //       return 'البيانات المرسلة غير صحيحة';
  //     case 401:
  //       return 'انتهت صلاحية جلستك، يرجى تسجيل الدخول مرة أخرى';
  //     case 403:
  //       return 'ليس لديك صلاحية للوصول لهذه الخدمة';
  //     case 404:
  //       return 'الصفحة أو البيانات المطلوبة غير موجودة';
  //     case 422:
  //       return 'البيانات المدخلة غير صالحة';
  //     case 500:
  //       return 'خطأ في الخادم، يرجى المحاولة لاحقاً';
  //     case 502:
  //       return 'خطأ في الاتصال بالخادم';
  //     case 503:
  //       return 'الخدمة غير متاحة حالياً';
  //     default:
  //       return 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى';
  //   }
  // }
