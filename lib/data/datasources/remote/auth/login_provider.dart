
import 'package:mygallery/data/model/users_model.dart';

import '../../../../core/classes/crud.dart';
import '../../../../core/constant/app_links.dart';

class LoginProvider {
  Crud crud;

  LoginProvider({required this.crud});

  postData(Map data) async {

    final response = await crud.postData(AppLinks.login, data , {'Accept':'application/json '});
     print('response $response');

    //return response.fold((l) => l, (r) =>UserModel.fromJson(r));
    return response.fold((l) => l, (r) => UserModel.fromJson(r));
  }
}

