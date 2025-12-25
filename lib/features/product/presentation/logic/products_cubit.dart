import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/error/failure.dart';

import 'package:test_app/features/product/data/model/all_product_model.dart';
import 'package:test_app/features/product/domain/product_use_case/get_product_use_case.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.getProductUseCase) : super(ProductsInitial());
  final GetProductUseCase getProductUseCase;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());

    final result = await getProductUseCase.call();

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