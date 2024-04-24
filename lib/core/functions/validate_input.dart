//
//
//
// import 'package:mygallery/core/constant/allApp_constants.dart';
// import 'package:get/get.dart';
//
// String? validateInput(String value , int min , int max , String type){
//
//      if(value.isEmpty){
//           return 'empty'.tr;
//      }
//
//      if(value.length < min){
//           return '${'min_length'.tr} $min';
//      }
//
//      if(value.length > max){
//           return '${'max_length'.tr} $max';
//      }
//
//      if(type == USER_NAME){
//           // if(value.isEmpty){
//           //      return 'username_empty'.tr;
//           // }
//           if(!GetUtils.isUsername(value)){
//                return 'username_form'.tr;
//           }
//
//      }else if(type == EMAIL){
//
//           if(!GetUtils.isEmail(value)){
//                return 'email_form'.tr;
//           }
//
//      }else if(type == PHONE_NUMBER) {
//           if (!GetUtils.isPhoneNumber(value)) {
//                return 'phonenumber_form'.tr;
//           }
//      }
//
//
//
//
//
//
//
//      return null;
//
// }