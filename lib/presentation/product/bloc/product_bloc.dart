import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_product_by_id_usecase.dart';
import '../../../domain/usecases/get_products_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final GetProductByIdUseCase getProductByIdUseCase;

  ProductBloc({required this.getProductsUseCase, required this.getProductByIdUseCase}) : super(const ProductInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<LoadProductByIdEvent>(_onLoadProductById);
  }

  Future<void> _onLoadProducts(LoadProductsEvent event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());

    final result = await getProductsUseCase();

    result.fold((failure) => emit(ProductError(failure.message)), (products) => emit(ProductsLoaded(products)));
  }

  Future<void> _onLoadProductById(LoadProductByIdEvent event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());

    final result = await getProductByIdUseCase(event.id);

    result.fold((failure) => emit(ProductError(failure.message)), (product) => emit(ProductLoaded(product)));
  }
}
