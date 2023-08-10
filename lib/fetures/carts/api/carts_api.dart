import 'package:store_project/common/network/dio_client.dart';
import 'package:store_project/common/network/endpoints.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/common/network/result_api.dart';
import 'package:store_project/common/service/get_it.dart';
import 'package:store_project/fetures/carts/model/carts_model.dart';

class CartsApi {
  final myDio = getIt.get<DioClient>();

  Future<ResultApi<List<CartsModel>>> getCarts() async {
    try {
      final res = await myDio.dio.get(EndPoints.cart);

      if (res.statusCode == 200) {
        List<CartsModel> list = [];
        res.data!.forEach((element) => list.add(CartsModel.fromJson(element)));
        return ResultApi.success(response: list);
      }
      return ResultApi.failure(
          error: NetworkExceptions.getDioException(res.statusCode));
    } catch (e) {
      return ResultApi.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
