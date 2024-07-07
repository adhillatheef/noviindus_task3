import 'package:http/http.dart' as http;
import 'package:noviindus_task3/secrets.dart';
import 'driver_model.dart';

class DriversRepository {
  final String apiUrl = 'https://flutter-api.noviindus.in/api/DriverApi';
  final Map<String, String> _headers = {
    'API-Key': Secrets.token,
    'Authorization': 'Bearer ${Secrets.apiKey}',
    'Cookie':
        'csrftoken=IEcmVmBl9oCg1T8IGIKqPintyslbFnf4; sessionid=4b2dokpwbkuhx75suz91xh3u24ueqtlz'
  };

  Future<List<Driver>?> fetchDrivers() async {
    try {
      var response = await http.get(Uri.parse(apiUrl), headers: _headers);

      if (response.statusCode == 200) {
        var driversList = driversFromJson(response.body);
        return driversList.drivers;
      } else {
        print('Failed to load drivers: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('An error occurred while fetching drivers: $e');
      return null;
    }
  }

  Future<bool> addDriver({
    required String name,
    required String mobile,
    required String licenseNo,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields.addAll({
        'name': name,
        'mobile': mobile,
        'license_no': licenseNo,
      });

      request.headers.addAll(_headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print('Failed to add driver: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('An error occurred while adding a driver: $e');
      return false;
    }
  }

  Future<bool> deleteDriver({
    required String id
  }) async {
    try {
      var request = http.MultipartRequest('DELETE', Uri.parse(apiUrl));
      request.fields.addAll({
        'driver_id': id
      });

      request.headers.addAll(_headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print('Failed to delete driver: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('An error occurred while deleting a driver: $e');
      return false;
    }
  }
}
