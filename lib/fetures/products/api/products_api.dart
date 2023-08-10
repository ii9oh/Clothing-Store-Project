import 'package:store_project/common/network/dio_client.dart';
import 'package:store_project/common/network/endpoints.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/common/network/result_api.dart';
import 'package:store_project/common/service/get_it.dart';
import 'package:store_project/fetures/products/model/products_model.dart';

class ProductsApi {
  final myDio = getIt.get<DioClient>();

  Future<ResultApi<List<ProductsModel>>> getProducts() async {
    try {
      final res = await myDio.dio.get(EndPoints.products);

      if (res.statusCode == 200) {
        List<ProductsModel> list = [];
        res.data!
            .forEach((element) => list.add(ProductsModel.fromJson(element)));
        return ResultApi.success(response: list);
      }
      return ResultApi.failure(
          error: NetworkExceptions.getDioException(res.statusCode));
    } catch (e) {
      return ResultApi.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
