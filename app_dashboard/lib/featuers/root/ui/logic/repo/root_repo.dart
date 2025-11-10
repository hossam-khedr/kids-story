import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/story_response.dart';

abstract class RootRepo{
  Future<Either<Failure, List<Story>>> searchStoriesByTitle({
    required String search,
    required int page,
    required int limit,
  });
}