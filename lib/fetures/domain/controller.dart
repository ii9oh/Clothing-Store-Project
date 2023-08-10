import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_project/fetures/carts/api/carts_api.dart';
import 'package:store_project/fetures/categories/api/categories_api.dart';
import 'package:store_project/fetures/products/api/products_api.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/fetures/domain/state.dart';
import 'package:store_project/fetures/users/api/users_api.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, StoreState>((ref) {
  return StoreNotifier();
});

class StoreNotifier extends StateNotifier<StoreState> {
  StoreNotifier() : super(StoreState.Initial());

  void getProducts(BuildContext context) async {
    try {
      final res = await ProductsApi().getProducts();
      res.when(
        success: (val) {
          state = state.copyWith(products: val);
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

  //---------------------------------------------------------------------------

  void getUsers(BuildContext context) async {
    try {
      final res = await UsersApi().getUsers();
      res.when(
        success: (val) {
          state = state.copyWith(users: val);
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

//------------------------------------------------------------------------------

  void getCarts(BuildContext context) async {
    try {
      final res = await CartsApi().getCarts();
      res.when(
        success: (val) {
          state = state.copyWith(carts: val);
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

//------------------------------------------------------------------------------

  void getCategories(BuildContext context) async {
    try {
      final res = await CategoriesApi().getCategories();
      res.when(
        success: (val) {
          state = state.copyWith(categories: val);
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
