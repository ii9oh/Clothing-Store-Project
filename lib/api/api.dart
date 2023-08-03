import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:store_project/model/carts_model.dart';
import 'package:store_project/model/products_model.dart';
import 'package:store_project/model/users_model.dart';

class APICall {
  Dio dio = Dio();

  Future<List<ProductsModel>> getProducts() async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['content-type'] = 'application/json';

      Response response = await dio.get("https://fakestoreapi.com/products");

      if (response.statusCode == 200) {
        List<ProductsModel> list = [];
        response.data!.forEach((element) {
          list.add(ProductsModel.fromJson(element));
        });

        return list;
      }
    } catch (e) {}

    return [];
  }

  Future<List<String>> getCatagory() async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['content-type'] = 'application/json';

      Response response =
          await dio.get("https://fakestoreapi.com/products/categories");

      if (response.statusCode == 200) {
        List<String> list = [];
        response.data!.forEach((element) {
          list.add(element);
        });

        return list;
      }
    } catch (e) {}
    return [];
  }

  //----------------------------------------------------------------------------

  Future<CartsModel> getCarts() async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['content-type'] = 'application/json';

      Response response = await dio.get("https://fakestoreapi.com/carts");

      if (response.statusCode == 200) {
        final data = CartsModel.fromJson(response.data!);
        return data;
      }
    } catch (e) {
      print(e);
    }

    return CartsModel();
  }

  //----------------------------------------------------------------------------

  Future<UsersModel> getUsers(int id) async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['content-type'] = 'application/json';

      Response response = await dio.get("https://fakestoreapi.com/users/${id}");

      if (response.statusCode == 200) {
        final data = UsersModel.fromJson(response.data!);
        return data;
      }
    } catch (e) {
      print(e);
    }

    return UsersModel();
  }
}
