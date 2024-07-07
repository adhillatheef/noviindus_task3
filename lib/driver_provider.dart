import 'package:flutter/material.dart';
import 'driver_model.dart';
import 'driver_repository.dart';

class DriversProvider with ChangeNotifier {
  final DriversRepository _driversRepository = DriversRepository();
  List<Driver>? _drivers;
  bool _isLoading = false;
  String? _errorMessage;

  List<Driver>? get drivers => _drivers;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  // DriversProvider(){
  //   fetchDrivers();
  // }

  Future<void> fetchDrivers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _drivers = await _driversRepository.fetchDrivers();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addDriver(
      {required BuildContext context, required String driverName, required String licenseNumber, required String mobileNumber,}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      bool response = await _driversRepository.addDriver(name: driverName, mobile: mobileNumber, licenseNo: licenseNumber);
      if(response){
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text('Driver deleted successfully'),
        ));
        Navigator.pop(context);
        await fetchDrivers();
      }
    }catch (e){
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteDriver(
      {required BuildContext? context, required String id}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      bool response = await _driversRepository.deleteDriver(id: id);
      if (response) {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text('Driver deleted successfully'),
        ));
        await fetchDrivers();
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

}
