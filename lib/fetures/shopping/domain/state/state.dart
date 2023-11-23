// ignore_for_file: unnecessary_this

import 'package:store_project/fetures/shopping/domain/model/products_model.dart';
import 'package:store_project/fetures/shopping/domain/model/users_model.dart';

enum Status { init, loading, error }

class StoreState {
  final List<ProductsModel> products;
  final List<UsersModel> users;
  final List<String> categories;
  final Status status;
  final String selectedCat;

  StoreState({
    required this.products,
    required this.users,
    required this.categories,
    required this.status,
    required this.selectedCat,
  });

  factory StoreState.Initial() {
    return StoreState(
      selectedCat: '',
      status: Status.loading,
      products: [],
      users: [],
      categories: [],
    );
  }

  StoreState copyWith(
      {List<ProductsModel>? products,
      List<UsersModel>? users,
      List<String>? categories,
      Status? status,
      String? selectedCat}) {
    return StoreState(
      products: products ?? this.products,
      users: users ?? this.users,
      categories: categories ?? this.categories,
      status: status ?? this.status,
      selectedCat: selectedCat ?? this.selectedCat,
    );
  }
}
