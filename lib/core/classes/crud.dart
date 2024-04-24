import "dart:convert";

import "package:dartz/dartz.dart";
import 'package:http/http.dart' as http;
import "package:mygallery/core/constant/connection_status.dart";
import "package:mygallery/core/functions/check_internet.dart";

class Crud {

  Future<Either<ConnectionStatus, List>> getData2(
      String url, Map data) async {
    try {
      if (await connectedToInternet()) {
        var response = await http.get(
            Uri.parse(url)
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(jsonDecode(response.body));
          return Right(jsonDecode(response.body ));
        } else {
          return const Left(ConnectionStatus.SERVERFAILURE);
          // return Future.error(response.statusCode);
        }
      } else {

        return const Left(ConnectionStatus.OFFLINEFAILURE);
      }
    } catch (e) {
      print(e);
      return const Left(ConnectionStatus.SERVERFAILURE);

      //  return Future.error(e.toString());
    }
  }
  ////////////////////////////////////////////////

  Future<Either<ConnectionStatus, Map<String,dynamic>>> getData(
      String url, Map<String,String> headers) async {
    try {
      if (await connectedToInternet()) {
        var response = await http.get(
           Uri.parse(url) , headers:headers
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(jsonDecode(response.body));
          return Right(jsonDecode(response.body ));
        } else {
          return const Left(ConnectionStatus.SERVERFAILURE);
          // return Future.error(response.statusCode);
        }
      } else {

        return const Left(ConnectionStatus.OFFLINEFAILURE);
      }
    } catch (e) {
      print(e);
      return const Left(ConnectionStatus.SERVERFAILURE);

      //  return Future.error(e.toString());
    }
  }

  Future<Either<ConnectionStatus, Map<String,dynamic>>> postData(
      String url, Map data ,Map<String,String> headers) async {
    try {
      if (await connectedToInternet()) {
        var response = await http.post(
            Uri.parse(url) , body: data,
            headers: headers
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
             print(jsonDecode(response.body));
          return Right(jsonDecode(response.body ));
        } else {
          return const Left(ConnectionStatus.SERVERFAILURE);
          // return Future.error(response.statusCode);
        }
      } else {

        return const Left(ConnectionStatus.OFFLINEFAILURE);
      }
    } catch (e) {

      return const Left(ConnectionStatus.SERVERFAILURE);

      //  return Future.error(e.toString());
    }
  }
}
