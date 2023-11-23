import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_project/fetures/shopping/api/categories_api.dart';
import 'package:store_project/fetures/shopping/api/products_api.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/fetures/shopping/domain/state/state.dart';
import 'package:store_project/fetures/shopping/api/users_api.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, StoreState>((ref) {
  return StoreNotifier();
});

class StoreNotifier extends StateNotifier<StoreState> {
  StoreNotifier() : super(StoreState.Initial());

  void selectCat(int index) {
    state = state.copyWith(
      selectedCat: state.categories[index] == state.selectedCat
          ? ''
          : state.categories[index],
    );
  }

  bool isShow(int index) {
    if (state.selectedCat == "") {
      return true;
    } else if (state.selectedCat == state.products[index].category) {
      return true;
    } else {
      return false;
    }
  }

//------------------------------------------------------------------------------

  void getAPI(BuildContext context) async {
    state = await state.copyWith(status: Status.loading);
    try {
      final resCategories = await CategoriesApi().getCategories();
      final resProducts = await ProductsApi().getProducts();
      final resUser = await UsersApi().getUsers();
      resCategories.when(
        success: (val) {
          state = state.copyWith(categories: val);
        },
        failure: (val) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(val.toErrorMessage())));
        },
      );
      resUser.when(
        success: (val) {
          state = state.copyWith(users: val);
        },
        failure: (val) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(val.toErrorMessage())));
        },
      );
      resProducts.when(
        success: (val) {
          state = state.copyWith(
            products: val,
            status: Status.init,
          );
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
