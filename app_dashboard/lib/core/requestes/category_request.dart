import 'package:image_picker/image_picker.dart';

class CategoryRequest{
  final String name;
  final String description;
  final XFile file;

  CategoryRequest({required this.name,required this.description,required this.file});
}