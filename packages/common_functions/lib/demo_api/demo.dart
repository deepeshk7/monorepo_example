import 'package:common_functions/abstracts/demoFunctions/DemoAbstractFunctions.dart';
import 'package:common_functions/models/Product.dart';
import 'package:dio/dio.dart';


// class DioEx {
//
//   DioEx._(){
//
//
//
//   }


//   static DioEx? _instance;
//
//   factory DioEx(){
//     _instance??=DioEx._();
//
//
//     return _instance!;
//   }
//
// }

class DioExample implements DemoFunctions{


  final String baseUrl = 'https://fakestoreapi.com';
  final Dio _dio = Dio();

  // Optional: Configure Dio with interceptors, timeout, etc.
  DioExample() {
  _dio.options.baseUrl = baseUrl;
  _dio.options.connectTimeout = const Duration(milliseconds: 5000);
  _dio.options.receiveTimeout = const Duration(milliseconds: 3000);

  // Add logging interceptor (optional)
  _dio.interceptors.add(LogInterceptor(
  requestBody: true,
  responseBody: true,
  ));
  }

  @override
  Future<Product> getProduct() async {
    int id=1;

  try {
  final response = await _dio.get('/products/$id');
  print("reached");

  if (response.statusCode == 200) {
  // Convert to Product model
  return Product.fromMap(response.data);
  } else {
  throw DioException(
  requestOptions: RequestOptions(path: '/products/$id'),
  message: 'Failed to load product. Status code: ${response.statusCode}',
  );
  }
  } on DioException catch (e) {
  throw Exception('Dio error: ${e.message}');
  } catch (e) {
  throw Exception('Error fetching product: $e');
  }
  }




}