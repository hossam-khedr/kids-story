import 'package:app_dashboard/featuers/dashboard/data/responses/dashboard_stats_response.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared/core/errors/failuer.dart';

abstract class DashboardRepo{
  Future<Either<Failure,StatisticsResponse>>getDashboardStats();
  Future<Either<Failure,void>>createCategory({
    required String name,
    required String description,
    required XFile file,
});
}