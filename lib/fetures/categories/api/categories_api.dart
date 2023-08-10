import 'package:store_project/common/network/dio_client.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/common/network/result_api.dart';
import 'package:store_project/common/service/get_it.dart';

class CategoriesApi {
  final myDio = getIt.get<DioClient>();

  Future<ResultApi<List<String>>> getCategories() async {
    try {
      final res =
          await myDio.dio.get("https://fakestoreapi.com/products/categories");

      if (res.statusCode == 200) {
        List<String> list = [];
        res.data!.forEach((element) {
          list.add(element);
        });

        return ResultApi.success(response: list);
      }
      return ResultApi.failure(
          error: NetworkExceptions.getDioException(res.statusCode));
    } catch (e) {
      return ResultApi.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
