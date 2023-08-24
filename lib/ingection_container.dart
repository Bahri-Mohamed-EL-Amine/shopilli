import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopilli/core/network/network_info.dart';
import 'package:shopilli/features/products/data/repositories/products_repository_impl.dart';
import 'package:shopilli/features/products/domain/repositories/products_repository.dart';
import 'package:shopilli/features/products/presentation/bloc/products_bloc.dart';

import 'features/products/data/datasources/products_remote_data_source.dart';
import 'features/products/domain/usecases/get_all_produts_usecase.dart';

final instance = GetIt.instance;

void init() {
  //? features
  //! blocs
  instance
      .registerFactory(() => ProductsBloc(getAllProductsUsecase: instance()));
  //! usecases
  instance.registerLazySingleton(
    () => GetAllProductsUsecase(prodcutsRepository: instance()),
  );
  //! repositories
  instance.registerLazySingleton<ProdcutsRepository>(
    () => ProductsRepositoryImpl(
      productsRemoteDataSource: instance(),
      networkInfo: instance(),
    ),
  );
  //! datasources
  instance.registerLazySingleton(
    () => ProductsRemoteDataSource(dio: instance()),
  );

  instance.registerLazySingleton(() => Dio());

  //? core
  //! services
  instance.registerLazySingleton(
      () => NetworkInfo(internetConnectionChecker: instance()));
  instance.registerLazySingleton(() => InternetConnectionChecker());
  //? external
}
