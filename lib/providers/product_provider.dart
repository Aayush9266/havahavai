// providers/product_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_models.dart';
import '../services/api_service.dart';

final productsProvider =
StateNotifierProvider<ProductsNotifier, AsyncValue<List<Product>>>(
      (ref) => ProductsNotifier(ref: ref),
);

class ProductsNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final Ref ref;
  int _page = 0;
  final int _limit = 10;
  bool _hasMore = true;

  ProductsNotifier({required this.ref}) : super(const AsyncValue.loading()) {
    loadInitialProducts();
  }

  Future<void> loadInitialProducts() async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.read(apiServiceProvider).getProducts(0, _limit);
      _hasMore = response.products.length >= _limit;
      state = AsyncValue.data(response.products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> loadMoreProducts() async {
    if (!_hasMore) return;

    _page++;
    final currentProducts = state.value ?? [];

    try {
      final response = await ref.read(apiServiceProvider).getProducts(_page * _limit, _limit);
      _hasMore = response.products.length >= _limit;
      state = AsyncValue.data([...currentProducts, ...response.products]);
    } catch (e) {
      _page--;
      rethrow;
    }
  }
}