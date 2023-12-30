import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

import 'classes/reqres_response.dart';
// import 'package:paquetes/paquetes.dart' as paquetes;

void main(List<String> arguments) {
  final url = Uri.parse('https://reqres.in/api/users?page=2');

  http.get(url).then((res) {
    // final body = convert.jsonDecode(res.body);
    final resReqRes = reqResResponseFromJson(res.body);
    print('page: ${resReqRes.page}');
    print('per_page: ${resReqRes.perPage}');
    print('id del tercer elemento: ${resReqRes.data[2].id}');
  });
}
