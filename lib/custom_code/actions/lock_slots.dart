// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:cloud_functions/cloud_functions.dart';

Future<String> lockSlots(List<String> selectedSlots, String userId) async {
  String debugInfo = '=== Lock Slots Debug Info ===\n';
  debugInfo += 'Input Parameters:\n';
  debugInfo += 'selectedSlots: $selectedSlots\n';
  debugInfo += 'userId: $userId\n';

  // Validate inputs
  if (selectedSlots == null || selectedSlots.isEmpty) {
    debugInfo += 'Error: No slots selected\n';
    debugInfo += 'selectedSlots is null or empty\n';
    return debugInfo;
  }

  if (userId == null || userId.isEmpty) {
    debugInfo += 'Error: No user ID provided\n';
    debugInfo += 'userId is null or empty\n';
    return debugInfo;
  }

  const maxRetries = 3;
  int retryCount = 0;
  bool success = false;

  while (retryCount < maxRetries && !success) {
    try {
      debugInfo += '\nAttempt ${retryCount + 1} of $maxRetries\n';
      debugInfo += 'Attempting to call cloud function...\n';

      final callable = FirebaseFunctions.instance.httpsCallable(
        'lockSlotsTemporarily',
        options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
      );

      debugInfo += 'Preparing data for cloud function...\n';
      final data = {'selectedSlots': selectedSlots, 'userId': userId};
      debugInfo += 'Data being sent: $data\n';

      debugInfo += 'Calling cloud function...\n';
      final result = await callable.call(data);
      debugInfo += 'Cloud function response received\n';
      debugInfo += 'Response data: ${result.data}\n';

      final responseData = result.data as Map<String, dynamic>;
      success = responseData['success'] ?? false;
      debugInfo += 'Success status: $success\n';

      if (!success) {
        debugInfo += 'Error Details:\n';
        debugInfo += 'Error message: ${responseData['error']}\n';
        if (responseData['details'] != null) {
          debugInfo += 'Additional details: ${responseData['details']}\n';
        }
        if (responseData['code'] != null) {
          debugInfo += 'Error code: ${responseData['code']}\n';
        }

        // If this wasn't the last attempt, wait before retrying
        if (retryCount < maxRetries - 1) {
          debugInfo += 'Waiting 2 seconds before retry...\n';
          await Future.delayed(Duration(seconds: 2));
        }
      }
    } catch (e) {
      debugInfo += 'Error in lockSlots:\n';
      debugInfo += 'Error type: ${e.runtimeType}\n';
      debugInfo += 'Error message: $e\n';
      if (e is FirebaseFunctionsException) {
        debugInfo += 'Firebase Functions Error Code: ${e.code}\n';
        debugInfo += 'Firebase Functions Error Details: ${e.details}\n';
      }

      // If this wasn't the last attempt, wait before retrying
      if (retryCount < maxRetries - 1) {
        debugInfo += 'Waiting 2 seconds before retry...\n';
        await Future.delayed(Duration(seconds: 2));
      }
    }

    retryCount++;
  }

  debugInfo += '\nFinal Status:\n';
  debugInfo += 'Total attempts: $retryCount\n';
  debugInfo += 'Final success: $success\n';
  debugInfo += '=== End Lock Slots Debug Info ===\n';

  return debugInfo;
}
