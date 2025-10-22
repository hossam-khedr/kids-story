import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/category_response.dart';
abstract class CategoriesRepo{
  Future<Either<Failure,void>>createCategory({required String title,required String image});
  Future<Either<Failure,List<CategoryResponse>>>fitchCategories();
  Future<Either<Failure,void>>deleteCategory(int categoryId);
}