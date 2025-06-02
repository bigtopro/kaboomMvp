import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
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

  String? controllers;

  dynamic result;

  List<String> timeSlotsSelected = [
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
  void addToTimeSlotsSelected(String item) => timeSlotsSelected.add(item);
  void removeFromTimeSlotsSelected(String item) =>
      timeSlotsSelected.remove(item);
  void removeAtIndexFromTimeSlotsSelected(int index) =>
      timeSlotsSelected.removeAt(index);
  void insertAtIndexInTimeSlotsSelected(int index, String item) =>
      timeSlotsSelected.insert(index, item);
  void updateTimeSlotsSelectedAtIndex(int index, Function(String) updateFn) =>
      timeSlotsSelected[index] = updateFn(timeSlotsSelected[index]);

  String? gameTypeSelected;

  List<String> lockedSlots = [];
  void addToLockedSlots(String item) => lockedSlots.add(item);
  void removeFromLockedSlots(String item) => lockedSlots.remove(item);
  void removeAtIndexFromLockedSlots(int index) => lockedSlots.removeAt(index);
  void insertAtIndexInLockedSlots(int index, String item) =>
      lockedSlots.insert(index, item);
  void updateLockedSlotsAtIndex(int index, Function(String) updateFn) =>
      lockedSlots[index] = updateFn(lockedSlots[index]);

  List<String> bookedSlots = [];
  void addToBookedSlots(String item) => bookedSlots.add(item);
  void removeFromBookedSlots(String item) => bookedSlots.remove(item);
  void removeAtIndexFromBookedSlots(int index) => bookedSlots.removeAt(index);
  void insertAtIndexInBookedSlots(int index, String item) =>
      bookedSlots.insert(index, item);
  void updateBookedSlotsAtIndex(int index, Function(String) updateFn) =>
      bookedSlots[index] = updateFn(bookedSlots[index]);

  String? duration;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
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
