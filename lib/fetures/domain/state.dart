// ignore_for_file: unnecessary_this

import 'package:store_project/fetures/carts/model/carts_model.dart';
import 'package:store_project/fetures/products/model/products_model.dart';
import 'package:store_project/fetures/users/model/users_model.dart';

class StoreState {
  final List<ProductsModel> products;
  final List<CartsModel> carts;
  final List<UsersModel> users;
  final List<String> categories;

  StoreState({
    required this.products,
    required this.carts,
    required this.users,
    required this.categories,
  });

  factory StoreState.Initial() {
    return StoreState(
      products: [],
      carts: [],
      users: [],
      categories: [],
    );
  }

  StoreState copyWith({
    List<ProductsModel>? products,
    List<CartsModel>? carts,
    List<UsersModel>? users,
    List<String>? categories,
  }) {
    return StoreState(
      products: products ?? this.products,
      carts: carts ?? this.carts,
      users: users ?? this.users,
      categories: categories ?? this.categories,
    );
  }
}
