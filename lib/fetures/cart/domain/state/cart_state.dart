import 'package:store_project/fetures/cart/domain/model/carts_model.dart';

enum Status { init, loading, error }

class CartState {
  final List<CartsModel> carts;
  final Status status;

  CartState({
    required this.carts,
    required this.status,
  });

  factory CartState.Initial() {
    return CartState(
      carts: [],
      status: Status.loading,
    );
  }

  CartState CopyWith({
    List<CartsModel>? carts,
    Status? status,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      status: status ?? this.status,
    );
  }
}
