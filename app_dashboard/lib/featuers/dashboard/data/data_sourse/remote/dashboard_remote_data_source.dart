import 'package:image_picker/image_picker.dart';

abstract class DashBoardRemoteDataSource{
  Future<dynamic>getDashboardStats();
  Future<dynamic>createCategory({
    required String name,
    required String description,
    required XFile file,
  });
}