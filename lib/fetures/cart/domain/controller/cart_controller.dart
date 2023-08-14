import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/fetures/cart/api/carts_api.dart';
import 'package:store_project/fetures/cart/domain/state/cart_state.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState.Initial());

  void getAPI(BuildContext context) async {
    state = await state.CopyWith(status: Status.loading);
    try {
      final resUsers = await CartsApi().getCarts();
      resUsers.when(
        success: (val) {
          state = state.CopyWith(carts: val);
        },
        failure: (val) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(val.toErrorMessage())));
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
