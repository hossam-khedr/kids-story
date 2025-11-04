import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/category_response.dart';

abstract class CategoriesRepo{
  Future<Either<Failure,List<CategoryResponse>>>getCategories();
  Future<Either<Failure,void>>deleteCategory({required int id});
}