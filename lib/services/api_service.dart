import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_models.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  final Dio _dio = Dio();

  Future<ProductResponse> getProducts(int skip, int limit) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/products',
        queryParameters: {'skip': skip, 'limit': limit},
      );
      return ProductResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}