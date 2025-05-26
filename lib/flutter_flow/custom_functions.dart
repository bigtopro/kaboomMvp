import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? joinListWithComma(List<String> consolesAvailable) {
  if (consolesAvailable.isEmpty) return null;
  return consolesAvailable.join(', ');
}

List<String>? generateTimeSlotsFromNow(
  int? numDays,
  int? weekdayStartHour,
  int? weekdayEndHour,
  int? weekendStartHour,
  int? weekendEndHour,
) {
  final now = DateTime.now();

  // Round down (now - 2 hours) to nearest 15-minute mark
  final adjustedNow = now.subtract(const Duration(hours: 8));
  final roundedMinutes = (adjustedNow.minute ~/ 15) * 15;

  final startTime = DateTime(
    adjustedNow.year,
    adjustedNow.month,
    adjustedNow.day,
    adjustedNow.hour,
    roundedMinutes,
  );

  final List<String> timeSlots = [];

  for (int i = 0; i < (numDays ?? 7); i++) {
    final day = DateTime(startTime.year, startTime.month, startTime.day)
        .add(Duration(days: i));
    final isWeekend =
        day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;

    final int startHour =
        isWeekend ? (weekendStartHour ?? 10) : (weekdayStartHour ?? 8);
    final int endHour =
        isWeekend ? (weekendEndHour ?? 22) : (weekdayEndHour ?? 23);

    final dayStartTime = DateTime(day.year, day.month, day.day, startHour);
    final dayEndTime = DateTime(day.year, day.month, day.day, endHour);

    DateTime slotTime =
        i == 0 && startTime.isAfter(dayStartTime) ? startTime : dayStartTime;

    while (slotTime.isBefore(dayEndTime)) {
      final slotString =
          '${slotTime.year.toString().padLeft(4, '0')}${slotTime.month.toString().padLeft(2, '0')}${slotTime.day.toString().padLeft(2, '0')}_'
          '${slotTime.hour.toString().padLeft(2, '0')}${slotTime.minute.toString().padLeft(2, '0')}';
      timeSlots.add(slotString);
      slotTime = slotTime.add(const Duration(minutes: 15));
    }
  }

  return timeSlots;
}

List<int> getUniqueControllerCounts(List<PricesRecord> priceList) {
  final controllerCounts =
      priceList.map((doc) => doc.controllerCount).toSet().toList()..sort();
  return controllerCounts;
}

List<String> getUniqueDurations(List<PricesRecord> priceList) {
  final durations = priceList.map((doc) => doc.duration).toSet().toList()
    ..sort();
  return durations;
}

int? selectedPriceCalculation(
  List<PricesRecord> priceDocuments,
  String? selectedDuration,
  String? selectedControllers,
) {
  if (selectedDuration == null || selectedControllers == null) {
    return null; // No selection made yet
  }

  // Convert selectedControllers to int
  int? controllerCount =
      int.tryParse(selectedControllers.replaceAll(RegExp(r'[^0-9]'), ''));
  if (controllerCount == null) {
    return null; // Invalid controller count input
  }

  // Find the matching price document
  for (var priceDoc in priceDocuments) {
    if (priceDoc.controllerCount == controllerCount &&
        priceDoc.duration == selectedDuration) {
      // Check if today is a weekend
      int weekday = DateTime.now().weekday; // 1 = Monday, 7 = Sunday
      bool isWeekend = (weekday == 6 || weekday == 7);
      double? price = isWeekend ? priceDoc.weekendPrice : priceDoc.weekdayPrice;
      return price?.toInt(); // ✅ cast to int
    }
  }

  return null; // No matching price found
}
