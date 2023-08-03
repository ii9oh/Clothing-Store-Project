import 'package:store_project/model/carts_model.dart';
import 'package:store_project/model/products_model.dart';
import 'package:store_project/model/users_model.dart';

class StoreState {
  final List<ProductsModel> products;
  final CartsModel cartsModel;
  final UsersModel usersModel;
  final List<String> categories;

  StoreState({
    required this.products,
    required this.cartsModel,
    required this.usersModel,
    required this.categories,
  });

  factory StoreState.Initial() {
    return StoreState(
      products: [],
      cartsModel: CartsModel(),
      usersModel: UsersModel(),
      categories: [],
    );
  }

  StoreState copyWith({
    List<ProductsModel>? productsModel,
    CartsModel? cartsModel,
    UsersModel? usersModel,
    List<String>? categories,
  }) {
    return StoreState(
      products: products,
      cartsModel: cartsModel ?? this.cartsModel,
      usersModel: usersModel ?? this.usersModel,
      categories: categories ?? this.categories,
    );
  }
}
