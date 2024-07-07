import 'package:flutter/material.dart';
import 'home_repository.dart';
import 'bus_model.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepository _homeRepository = HomeRepository();
  List<BusElement>? _busList;
  bool _isLoading = false;

  List<BusElement>? get busList => _busList;

  bool get isLoading => _isLoading;

  HomeProvider() {
    fetchBusList();
  }

  Future<void> fetchBusList() async {
    _isLoading = true;
    notifyListeners();

    _busList = await _homeRepository.fetchBusList();

    _isLoading = false;
    notifyListeners();
  }
}
