
import 'package:get_storage/get_storage.dart';
import 'package:mygallery/core/constant/allApp_constants.dart';
import 'package:mygallery/data/model/data_model.dart';
import '../../../core/classes/crud.dart';
import '../../../core/constant/app_links.dart';

class HomeProvider {
  Crud crud;
  HomeProvider(this.crud);


  postImage(Map data) async {
    var response = await crud.postData(AppLinks.postImage, data, {
      'Accept': 'application/json ',
      'Authorization': 'Bearer ${box.read(USER_MODEL)['token']}'
    });
    // r is supposed to be model
    return response.fold((l) => l, (r) => DataModel.fromJson(r));
  }


  getImages()async{

    var response = await crud.getData(AppLinks.getImages, {
      'Accept':'application/json',
      'Authorization': 'Bearer ${box.read(USER_MODEL)['token']}'
    });

     return response.fold((l) => l, (r) => DataModel.fromJson(r));

  }
}
