import 'package:get_storage/get_storage.dart';

class Constance{


  static  String name = box.read(USER_MODEL)['name'];
  static  String email = GetStorage().read(USER_MODEL)['email'];
  static  String token = GetStorage().read(USER_MODEL)['token'];


}
//user_model
const String USER_MODEL = 'user_model';
final box = GetStorage();