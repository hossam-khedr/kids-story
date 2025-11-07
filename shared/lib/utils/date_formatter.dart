import 'package:jiffy/jiffy.dart';

String formatArabicDate(String date) {
  final dateFormate = Jiffy.parse(date).format(pattern: 'd MMMM yyyy');
  return 'تم النشر في $dateFormate';
}
