import 'package:http/http.dart' as http;
import 'package:noviindus_task3/secrets.dart';
import 'bus_model.dart';

class HomeRepository {
  final String _baseUrl = 'https://flutter-api.noviindus.in/api/';
  final Map<String, String> _headers = {
    'API-Key': Secrets.token,
    'Authorization': 'Bearer ${Secrets.apiKey}',
    'Cookie':
        'csrftoken=IEcmVmBl9oCg1T8IGIKqPintyslbFnf4; sessionid=4b2dokpwbkuhx75suz91xh3u24ueqtlz'
  };

  Future<List<BusElement>?> fetchBusList() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/BusListApi'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      var busList = busFromJson(response.body);
      return busList.bus;
    } else {
      print('Failed to load bus list: ${response.reasonPhrase}');
      return null;
    }
  }
}
