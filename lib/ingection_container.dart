import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shopilli/core/network/network_info.dart';
import 'package:shopilli/features/categories/data/datasources/remote_data_source.dart';
import 'package:shopilli/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:shopilli/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:shopilli/features/navigation/bloc/navigation_bloc.dart';
import 'package:shopilli/features/products/data/repositories/products_repository_impl.dart';
import 'package:shopilli/features/products/domain/repositories/products_repository.dart';
import 'package:shopilli/features/products/domain/usecases/add_product_cart_usecase.dart';
import 'package:shopilli/features/products/domain/usecases/get_cart_products_usecase.dart';
import 'package:shopilli/features/products/domain/usecases/remove_product_usecase.dart';
import 'package:shopilli/features/products/presentation/bloc/cart/cart_bloc.dart';
import 'package:shopilli/features/products/presentation/bloc/products/products_bloc.dart';

import 'features/categories/data/repositories/categories_repository_impl.dart';
import 'features/categories/domain/repositories/categoires_repository.dart';
import 'features/products/data/datasources/products_remote_data_source.dart';
import 'features/products/domain/usecases/get_all_produts_usecase.dart';
import 'features/products/domain/usecases/get_products_by_category_usecase.dart';

final instance = GetIt.instance;

void init() {
  //? features
  //! blocs
  instance.registerFactory(() => ProductsBloc(
      getAllProductsUsecase: instance(),
      getProductsByCategoryUsecase: instance()));
  instance.registerFactory(() => NavigationBloc());
  instance.registerFactory(
      () => CategoriesBloc(getAllCategoriesUsecase: instance()));
  instance.registerFactory(() => CartBloc(
      removeProductUsecase: instance(),
      getCartProducstUsecase: instance(),
      addProductCartUsecase: instance()));
  //! usecases
  instance.registerLazySingleton(
      () => RemoveProductUsecase(productsRepository: instance()));
  instance.registerLazySingleton(
      () => GetProductsByCategoryUsecase(prodcutsRepository: instance()));
  instance.registerLazySingleton(
      () => GetCartProducstUsecase(prodcutsRepository: instance()));
  instance.registerLazySingleton(
      () => AddProductCartUsecase(prodcutsRepository: instance()));
  instance.registerLazySingleton(
    () => GetAllProductsUsecase(prodcutsRepository: instance()),
  );
  instance.registerLazySingleton(
    () => GetAllCategoriesUsecase(categoriesRepository: instance()),
  );
  //! repositories
  instance.registerLazySingleton<ProdcutsRepository>(
    () => ProductsRepositoryImpl(
      productsRemoteDataSource: instance(),
    ),
  );
  instance.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(
        networkInfo: instance(), categoriesRemoteDataSource: instance()),
  );
  //! datasources
  instance.registerLazySingleton(
    () => ProductsRemoteDataSource(dio: instance(), networkInfo: instance()),
  );
  instance.registerLazySingleton(() =>
      CategoriesRemoteDataSource(dio: instance(), networkInfo: instance()));

  instance.registerLazySingleton(() => Dio());

  //? core
  //! services
  instance.registerLazySingleton(
      () => NetworkInfo(internetConnectionChecker: instance()));
  instance.registerLazySingleton(() => InternetConnectionChecker());
  //? external
}
