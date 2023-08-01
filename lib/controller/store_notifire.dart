import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_project/api/api.dart';
import 'package:store_project/controller/store_state.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, StoreState>((ref) {
  return StoreNotifier();
});

class StoreNotifier extends StateNotifier<StoreState> {
  StoreNotifier() : super(StoreState.Initial());

  void getProducts() async {
    try {
      // res = respond
      final res = await APICall().getProducts();

      state = state.copyWith(
        productsModel: res,
      );
    } catch (e) {}
  }

  void getCarts() async {
    try {
      final res = await APICall().getCarts();
      state = state.copyWith(
        cartsModel: res,
      );
    } catch (e) {}
  }

  void getUsers(int id) async {
    try {
      final res = await APICall().getUsers(id);
      state = state.copyWith(
        usersModel: res,
      );
    } catch (e) {}
  }

  void getCategories() async {
    try {
      final res = await APICall().getCatagory();
      state = state.copyWith(
        categories: res,
      );
    } catch (e) {}
  }
}
