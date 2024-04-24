/*
packages to check internet 
1-connectivity_plus
2-internet_connection_checker
*/

import 'dart:io';


Future<bool> connectedToInternet() async {
  try {
    var result = await InternetAddress.lookup(
        'google.com'); //perform resolution through google dns 8.8.8.8

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (e) {
    print("Exception is :: $e");
    return false;
  }
}

