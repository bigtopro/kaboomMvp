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

List<int> getUniqueControllerCounts(
  List<PricesRecord> priceList,
  String? gameType,
) {
  final filtered = gameType == null || gameType.isEmpty
      ? priceList
      : priceList.where((doc) => doc.gameType == gameType).toList();

  final controllerCounts = filtered
      .map((doc) => doc.controllerCount)
      .whereType<int>()
      .toSet()
      .toList()
    ..sort();

  return controllerCounts;
}

List<String> getUniqueDurations(
  List<PricesRecord> priceList,
  String? gameType,
) {
  final filtered = gameType == null || gameType.isEmpty
      ? priceList
      : priceList.where((doc) => doc.gameType == gameType).toList();

  final durations = filtered
      .map((doc) => doc.duration)
      .whereType<String>()
      .toSet()
      .toList()
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

String getOrderId(dynamic orderResponse) {
  try {
    // Convert the input to a Map if it's a String
    Map<String, dynamic> responseMap;
    if (orderResponse is String) {
      responseMap = jsonDecode(orderResponse) as Map<String, dynamic>;
    } else {
      responseMap = orderResponse as Map<String, dynamic>;
    }

    // Check if the response contains orderId
    if (responseMap.containsKey('orderId')) {
      return responseMap['orderId'].toString();
    } else {
      return '';
    }
  } catch (e) {
    return '';
  }
}

List<String> getUniqueGameTypes(List<PricesRecord> priceDocs) {
  final Set<String> gameTypes = {};

  for (final doc in priceDocs) {
    final gameType = doc.gameType;
    if (gameType != null && gameType.trim().isNotEmpty) {
      gameTypes.add(gameType.trim());
    }
  }

  return gameTypes.toList();
}

Color getGameTypeButtonColorAtIndex(
  List<PricesRecord> priceDocs,
  int index,
  String? selectedGameType,
) {
  // Helper: get unique gameTypes
  final Set<String> gameTypesSet = {};
  for (final doc in priceDocs) {
    final gameType = doc.gameType;
    if (gameType != null && gameType.trim().isNotEmpty) {
      gameTypesSet.add(gameType.trim());
    }
  }
  final uniqueGameTypes = gameTypesSet.toList();

  // Safety check for index
  if (index < 0 || index >= uniqueGameTypes.length) {
    return const Color(0xFFA474F0); // default color (#a474f0)
  }

  final currentGameType = uniqueGameTypes[index];

  // Compare and return color
  if (currentGameType == selectedGameType) {
    return const Color(0xFF6A03F3); // selected color (#6A03F3)
  } else {
    return const Color(0xFFA474F0); // default color (#a474f0)
  }
}

Color getSlotColor(
  List<String>? lockedSlots,
  List<String>? bookedSlots,
  String slotTime,
) {
  if (lockedSlots != null && lockedSlots.contains(slotTime)) {
    return const Color(0xFFF9A53A); // Locked slot color
  }

  if (bookedSlots != null && bookedSlots.contains(slotTime)) {
    return const Color(0xFF707173); // Booked slot color
  }

  final minute = slotTime.split('_')[1].substring(2, 4);
  return minute == '00' ? const Color(0xFF010002) : const Color(0xFF6A03F3);
}

List<String>? getSelectableSlotsOrNull(
  String selectedSlot,
  String? duration,
  List<String>? lockedSlots,
  List<String>? bookedSlots,
) {
  if (selectedSlot.isEmpty || duration == null) return null;

  final parts = selectedSlot.split('_');
  if (parts.length != 2) return null;

  final date = parts[0];
  final time = parts[1];

  final startDateTime = DateFormat("yyyyMMdd_HHmm").parse("$date\_$time");

  // Normalize duration (e.g., "1 hr" => "1hr")
  final normalizedDuration = duration.replaceAll(' ', '').toLowerCase();

  final match = RegExp(r'(\d+)').firstMatch(normalizedDuration);
  if (match == null) return null;
  final hours = int.parse(match.group(1)!);
  final totalMinutes = hours * 60;
  final slotCount = (totalMinutes / 15).round();

  List<String> selectedSlots = [];
  for (int i = 0; i < slotCount; i++) {
    final slotTime = startDateTime.add(Duration(minutes: i * 15));
    final slotString = DateFormat("yyyyMMdd_HHmm").format(slotTime);
    selectedSlots.add(slotString);
  }

  final allBlockedSlots = {...?lockedSlots, ...?bookedSlots};

  for (final slot in selectedSlots) {
    if (allBlockedSlots.contains(slot)) {
      return null;
    }
  }

  return selectedSlots;
}
