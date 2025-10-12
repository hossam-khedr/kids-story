import 'package:kids_story_ai/app/index.dart';

abstract class AuthRepo{
  Future<Either<Failure,void>>register(String name,String email,String password);
  Future<Either<Failure,void>>login(String email,String password);
}