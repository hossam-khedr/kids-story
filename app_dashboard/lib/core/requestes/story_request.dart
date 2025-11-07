import 'package:image_picker/image_picker.dart';

class StoryRequest {
  final String title;
  final String content;
  final String categoryName;
  final int ageMin;
  final int ageMax;
  final bool isActive;
  final XFile file;

  StoryRequest({
    required this.title,
    required this.content,
    required this.categoryName,
    required this.ageMin,
    required this.ageMax,
    required this.isActive,
    required this.file,
  });


}
