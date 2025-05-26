import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'booking_page_widget.dart' show BookingPageWidget;
import 'package:flutter/material.dart';

class BookingPageModel extends FlutterFlowModel<BookingPageWidget> {
  ///  Local state fields for this page.

  String? selectedTime;

  int weekdayStartHour = 0;

  int weekdayEndHour = 24;

  int weekendStartHour = 2;

  int weekendEndHour = 24;

  int totalPrice = 0;

  String? players;

  double? verticalLineY;

  String? duration;

  String? controllers;

  dynamic result;

  List<String> time = [
    '20250527_2030',
    '20250527_2045',
    '20250527_2100',
    '20250527_2115',
    '20250527_2130',
    '20250527_2145',
    '20250527_2200',
    '20250527_2215',
    '20250527_2230',
    '20250527_2245'
  ];
  void addToTime(String item) => time.add(item);
  void removeFromTime(String item) => time.remove(item);
  void removeAtIndexFromTime(int index) => time.removeAt(index);
  void insertAtIndexInTime(int index, String item) => time.insert(index, item);
  void updateTimeAtIndex(int index, Function(String) updateFn) =>
      time[index] = updateFn(time[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Custom Action - lockSlots] action in Button widget.
  String? status;

  /// Query cache managers for this widget.

  final _cafePricesManager = StreamRequestManager<List<PricesRecord>>();
  Stream<List<PricesRecord>> cafePrices({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PricesRecord>> Function() requestFn,
  }) =>
      _cafePricesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCafePricesCache() => _cafePricesManager.clear();
  void clearCafePricesCacheKey(String? uniqueKey) =>
      _cafePricesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCafePricesCache();
  }
}
