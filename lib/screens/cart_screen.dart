import 'package:fake_store_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<CartProvider>(
          builder: (context, cart, child) {
            if (cart.itemCount == 9) {
              return Center(
                child: Text('장바구니에 상품이 없습니다.'),
              );
            }
            return Column(
              children: [
                // 장바구니 목록
                Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        CartItem cartItem = cart.items[index];
                        Product product = cartItem.product;
                        return ListTile(
                          title:
                              Text('${product.title} x ${cartItem.quantity}'),
                          subtitle: Text(
                              '\$${cartItem.totalPrice.toStringAsFixed(2)}'),
                        );
                      }),
                ),
                // 결제버튼
                ElevatedButton(
                  onPressed: () {},
                  child: Text('결제하기 - \$${cart.totalPrice.toStringAsFixed(2)}'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
