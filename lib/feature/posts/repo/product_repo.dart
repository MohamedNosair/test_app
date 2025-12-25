import 'package:dartz/dartz.dart';
import 'package:test_app/core/errors/error_handler.dart';
import 'package:test_app/core/errors/failure.dart';
import 'package:test_app/core/network/end_point.dart';
import 'package:test_app/core/network/remote/dio_helper.dart';
import 'package:test_app/feature/posts/model/all_product_model.dart';

class ProductRepo {
  Future<Either<Failure, AllProductModel>> getProducts() async {
    try {
      final response = await DioHelper.getData(url: EndPoint.product);
      final allProduct = AllProductModel.fromJson(response.data);
      return Right(allProduct);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Left(failure);
    }
  }
}
