import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_models.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
      (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      state[index].quantity++;
      state = [...state];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void removeFromCart(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void updateQuantity(int productId, int newQuantity) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      state[index].quantity = newQuantity;
      state = [...state];
    }
  }
  void clearCart() {
    state = [];
  }

  double get totalPrice => state.fold(
    0,
        (total, item) => total + (item.product.discountedPrice * item.quantity),
  );
}