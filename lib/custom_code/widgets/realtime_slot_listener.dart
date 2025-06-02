// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart'; // <-- Add this import

class RealtimeSlotListener extends StatefulWidget {
  const RealtimeSlotListener({
    super.key,
    this.width,
    this.height,
    required this.cafeRef,
    this.gameType,
    required this.slotType,
    this.onData,
  });

  final double? width;
  final double? height;
  final String cafeRef;
  final String? gameType;
  final String slotType;
  final Future Function(List<String>? slotList)? onData;

  @override
  State<RealtimeSlotListener> createState() => _RealtimeSlotListenerState();
}

class _RealtimeSlotListenerState extends State<RealtimeSlotListener> {
  DatabaseReference? _ref;
  StreamSubscription<DatabaseEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  @override
  void didUpdateWidget(covariant RealtimeSlotListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.cafeRef != oldWidget.cafeRef ||
        widget.gameType != oldWidget.gameType ||
        widget.slotType != oldWidget.slotType) {
      _subscription?.cancel();
      _startListening();
    }
  }

  void _startListening() {
    if (widget.gameType == null || widget.gameType!.isEmpty) {
      return;
    }

    final path =
        'public/${widget.slotType}/${widget.cafeRef}/${widget.gameType}';

    final firebaseApp = Firebase.app(); // Get the default initialized app

    _ref = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL:
          'https://kaboomapp-32688-default-rtdb.asia-southeast1.firebasedatabase.app',
    ).ref(path);

    _subscription = _ref!.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      final slots = data?.keys.map((key) => key.toString()).toList() ?? [];

      if (widget.onData != null) {
        widget.onData!(slots);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Invisible widget, just listens in background
    return const SizedBox.shrink();
  }
}
