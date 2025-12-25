part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  final AllProductModel products;

  const ProductsSuccess({required this.products});

  @override
  List<Object> get props => [products];
}
final class ProductsFailure extends ProductsState {
  final Failure failure;

  const ProductsFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}