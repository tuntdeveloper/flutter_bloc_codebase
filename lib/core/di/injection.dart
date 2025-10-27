import 'package:get_it/get_it.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_product_by_id_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../presentation/product/bloc/product_bloc.dart';

final injector = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Data Sources
  injector.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl());

  // Repositories
  injector.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(injector()));

  // Use Cases
  injector.registerLazySingleton(() => GetProductsUseCase(injector()));
  injector.registerLazySingleton(() => GetProductByIdUseCase(injector()));

  // BLoC
  injector.registerFactory(() => ProductBloc(getProductsUseCase: injector(), getProductByIdUseCase: injector()));
}
