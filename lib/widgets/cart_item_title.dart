// widgets/cart_item_tile.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_provider.dart';

class CartItemTile extends ConsumerWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Image.network(
        item.product.thumbnail,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const Icon(Icons.error),
      ),
      title: Text(item.product.title),
      subtitle: Text(
        '\$${(item.product.discountedPrice * item.quantity).toStringAsFixed(2)}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => _updateQuantity(ref, item.quantity - 1),
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _updateQuantity(ref, item.quantity + 1),
          ),
        ],
      ),
    );
  }

  void _updateQuantity(WidgetRef ref, int newQuantity) {
    if (newQuantity > 0) {
      ref
          .read(cartProvider.notifier)
          .updateQuantity(item.product.id, newQuantity);
    } else {
      ref.read(cartProvider.notifier).removeFromCart(item.product.id);
    }
  }
}