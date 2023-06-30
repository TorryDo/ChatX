import 'package:chatx/src/data/auth/repository/auth_repository_impl.dart';
import 'package:chatx/src/domain/auth/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

void domainModules() {
  GetIt.I.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
