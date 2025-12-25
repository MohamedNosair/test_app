import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/errors/failure.dart';
import 'package:test_app/feature/posts/model/all_product_model.dart';
import 'package:test_app/feature/posts/repo/product_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());

    final result = await productRepo.getProducts();

    result.fold(
      (failure) {
        log('Error fetching products: ${failure.message}');
        emit(ProductsFailure(failure: failure));
      },
      (products) {
        emit(ProductsSuccess(products: products));
      },
    );
  }
}
