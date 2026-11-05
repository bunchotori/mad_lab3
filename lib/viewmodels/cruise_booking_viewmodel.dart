import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {

  final CruiseDestination destination = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description: 'Experience the heart of Sibu along Malaysia\'s longest river. Cruise past historical temples, amber hubs, and waterfront settlements while experiencing authentic Sarawakian hospitality.',
    imageUrl: 'assets/rajangriver.png',
    ratingCount: 43,
  );

  //Interactive
  DateTime _selectedDate = DateTime.now();
  String _selectedPackage = 'Express Boat';
  bool _isDarkMode = false;

  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;


  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void incrementRating() {
    destination.ratingCount++;
    notifyListeners();
  }
}