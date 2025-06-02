import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
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
      _formattedphoneNumber =
          prefs.getString('ff_formattedphoneNumber') ?? _formattedphoneNumber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  String _formattedphoneNumber = '';
  String get formattedphoneNumber => _formattedphoneNumber;
  set formattedphoneNumber(String value) {
    _formattedphoneNumber = value;
    prefs.setString('ff_formattedphoneNumber', value);
  }

  final _homePageInfoManager = StreamRequestManager<List<CafeDetailsRecord>>();
  Stream<List<CafeDetailsRecord>> homePageInfo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CafeDetailsRecord>> Function() requestFn,
  }) =>
      _homePageInfoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomePageInfoCache() => _homePageInfoManager.clear();
  void clearHomePageInfoCacheKey(String? uniqueKey) =>
      _homePageInfoManager.clearRequest(uniqueKey);
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
