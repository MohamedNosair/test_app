import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/error/widget/erro_widget.dart';
import 'package:test_app/features/product/presentation/logic/products_cubit.dart';
import 'package:test_app/features/product/domain/product_use_case/get_product_use_case.dart';
import 'package:test_app/features/product/data/repo_impl/product_repo_impl.dart';


class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المنتجات'), centerTitle: true),
      body: BlocProvider(
        create: (context) => ProductsCubit(GetProductUseCase(repo: ProductRepoImpl()))..fetchProducts(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsFailure) {
              return CustomErrorWidget(
                failure: state.failure,
                onRetry: () {
                  context.read<ProductsCubit>().fetchProducts();
                },
              );
            } else if (state is ProductsSuccess) {
              final products = state.products;

              return ListView.builder(
                itemCount: products.productsEntity.length,
                itemBuilder: (context, index) {
                  final product = products.productsEntity[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('\$${product.price}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('مرحباً بك'));
          },
        ),
      ),
    );
  }
}