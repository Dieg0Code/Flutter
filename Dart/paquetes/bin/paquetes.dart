import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
// import 'package:paquetes/paquetes.dart' as paquetes;

void main(List<String> arguments) {
  final url = Uri.parse('https://reqres.in/api/users?page=2');

  http.get(url).then((res) {
    final body = convert.jsonDecode(res.body);
  });
}
