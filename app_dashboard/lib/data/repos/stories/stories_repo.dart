import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';

abstract class StoriesRepo{
  Future<Either<Failure,void>>createStory({
    required String title,
    required String image,
    required String desc,
    required String content,
    required int id,
  });
}