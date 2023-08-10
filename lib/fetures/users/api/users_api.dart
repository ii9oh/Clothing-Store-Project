import 'package:store_project/common/network/dio_client.dart';
import 'package:store_project/common/network/network_exceptions.dart';
import 'package:store_project/common/network/result_api.dart';
import 'package:store_project/common/service/get_it.dart';
import 'package:store_project/fetures/users/model/users_model.dart';

class UsersApi {
  final myDio = getIt.get<DioClient>();

  Future<ResultApi<List<UsersModel>>> getUsers() async {
    try {
      final res = await myDio.dio.get("https://fakestoreapi.com/users");

      if (res.statusCode == 200) {
        List<UsersModel> list = [];
        res.data!.forEach((element) => list.add(UsersModel.fromJson(element)));
        return ResultApi.success(response: list);
      }
      return ResultApi.failure(
          error: NetworkExceptions.getDioException(res.statusCode));
    } catch (e) {
      return ResultApi.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
