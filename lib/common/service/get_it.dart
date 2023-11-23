import 'package:get_it/get_it.dart';
import 'package:store_project/common/network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<DioClient>(DioClient());
}
