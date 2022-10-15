import 'package:http/http.dart' as http;
import 'package:favorite/utils/urls.dart';

class BusinessController {
  BusinessController._privateConstructor();
  static final BusinessController _instance =
      BusinessController._privateConstructor();
  factory BusinessController() => _instance;

  final header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  // Future<dynamic> getBusinesses(int idCity) async {
  //   try {
  //     final response =
  //         await http.post(Uri.parse('$backUrl/kilometers/business'),
  //             headers: header,
  //             body: json.encode({
  //               "id_city": idCity,
  //             }));
  //     if (response.statusCode == 200) {
  //       final data = businessListResponseFromMap(response.body);
  //       return data;
  //     } else {
  //       return ErrorResponse(statusCode: 400, message: "No encontrado");
  //     }
  //   } on SocketException {
  //     return ErrorResponse.network;
  //   } catch (_) {
  //     return ErrorResponse.unknown;
  //   }
  // }
}
