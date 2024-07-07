import 'login_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String url = 'https://flutter-api.noviindus.in/api/LoginApi';
  final Map<String, String> _headers = {
    'Cookie': 'csrftoken=IEcmVmBl9oCg1T8IGIKqPintyslbFnf4; sessionid=4b2dokpwbkuhx75suz91xh3u24ueqtlz'
  };

  Future<Login?> login(String username, String password) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'username': username,
      'password': password
    });

    request.headers.addAll(_headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return loginFromJson(responseBody);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}