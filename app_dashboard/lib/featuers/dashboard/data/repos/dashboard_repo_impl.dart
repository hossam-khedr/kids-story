import 'package:app_dashboard/core/requestes/category_request.dart';
import 'package:app_dashboard/core/requestes/story_request.dart';
import 'package:app_dashboard/featuers/dashboard/data/data_sourse/remote/dashboard_remote_data_source.dart';
import 'package:app_dashboard/core/responses/categories_names_response.dart';
import 'package:app_dashboard/core/responses/dashboard_stats_response.dart';
import 'package:app_dashboard/featuers/dashboard/ui/logic/dashboard_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/core/errors/error_handler.dart';
import 'package:shared/core/errors/failuer.dart';
import 'package:shared/core/network/network_info.dart';
import 'package:shared/responses/story_response.dart';
import 'package:shared/utils/helpers/safe_api_call.dart';

class DashboardRepoImpl implements DashboardRepo {
  final NetworkInfo networkInfo;
  final DashBoardRemoteDataSource remoteDataSource;

  DashboardRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> createCategory({
    required CategoryRequest request,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        await remoteDataSource.createCategory(request: request);
      },
    );
  }

  @override
  Future<Either<Failure, List<CategoriesNamesResponse>>>
  getCategoriesNames() async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await remoteDataSource.getCategoriesNames();
        final data = response.data['categories'] as List;
        final result = data
            .map((e) => CategoriesNamesResponse.fromJson(e))
            .toList();
        return result;
      },
    );
  }

  @override
  Future<Either<Failure, void>> createStory({
    required StoryRequest request,
  }) async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        await remoteDataSource.createStory(request);
      },
    );
  }

  @override
  Future<Either<Failure, StatisticsResponse>> getDashboardStats() async {
    return ApiCallHelper().safeApiCall(
      callback: () async {
        final response = await remoteDataSource.getDashboardStats();
        final data = StatisticsResponse.fromJson(response.data);
        return data;
      },
    );
  }

}
