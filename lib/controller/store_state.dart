import 'package:store_project/model/carts_model.dart';
import 'package:store_project/model/products_model.dart';
import 'package:store_project/model/users_model.dart';

class StoreState {
  final ProductsModel productsModel;
  final CartsModel cartsModel;
  final UsersModel usersModel;
  final List<String> categories;

  StoreState({
    required this.productsModel,
    required this.cartsModel,
    required this.usersModel,
    required this.categories,
  });

  factory StoreState.Initial() {
    return StoreState(
      productsModel: ProductsModel(),
      cartsModel: CartsModel(),
      usersModel: UsersModel(),
      categories: [],
    );
  }

  StoreState copyWith({
    ProductsModel? productsModel,
    CartsModel? cartsModel,
    UsersModel? usersModel,
    List<String>? categories,
  }) {
    return StoreState(
      productsModel: productsModel ?? this.productsModel,
      cartsModel: cartsModel ?? this.cartsModel,
      usersModel: usersModel ?? this.usersModel,
      categories: categories ?? this.categories,
    );
  }
}
