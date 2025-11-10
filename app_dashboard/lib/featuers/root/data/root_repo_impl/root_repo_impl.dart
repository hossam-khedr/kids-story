import 'package:app_dashboard/featuers/root/data/remote/root_remote_data_source.dart';
import 'package:app_dashboard/featuers/root/ui/logic/repo/root_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/responses/story_response.dart';
import 'package:shared/utils/helpers/safe_api_call.dart';

class RootRepoImpl implements RootRepo {
  final RootRemoteDataSource dataSource;

  RootRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Story>>> searchStoriesByTitle({
    required String search,
    required int page,
    required int limit,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await dataSource.searchStoriesByTitle(
          search: search,
          page: page,
          limit: limit,
        );
        final data = response.data['stories'] as List;
        final result = data.map((e) => Story.fromJson(e)).toList();
        return result;
      },
    );
  }
}
