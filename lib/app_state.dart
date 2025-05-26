import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Username = prefs.getString('ff_Username') ?? _Username;
    });
    _safeInit(() {
      _PhoneNumberOnboarded =
          prefs.getString('ff_PhoneNumberOnboarded') ?? _PhoneNumberOnboarded;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// User selected Cafe
  String _selectedCafeId = '';
  String get selectedCafeId => _selectedCafeId;
  set selectedCafeId(String value) {
    _selectedCafeId = value;
  }

  /// Payment amount user is making
  double _paymentAmount = 0.0;
  double get paymentAmount => _paymentAmount;
  set paymentAmount(double value) {
    _paymentAmount = value;
  }

  String _Username = '';
  String get Username => _Username;
  set Username(String value) {
    _Username = value;
    prefs.setString('ff_Username', value);
  }

  String _PhoneNumberOnboarded = '';
  String get PhoneNumberOnboarded => _PhoneNumberOnboarded;
  set PhoneNumberOnboarded(String value) {
    _PhoneNumberOnboarded = value;
    prefs.setString('ff_PhoneNumberOnboarded', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
