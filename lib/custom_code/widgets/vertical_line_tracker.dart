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

class VerticalLineTracker extends StatefulWidget {
  const VerticalLineTracker({
    super.key,
    this.width,
    this.height,
    required this.child,
    required this.onYCoordinateDetected,
  });

  final double? width;
  final double? height;
  final Widget Function() child;
  final Future Function(double yCoordinate) onYCoordinateDetected;

  @override
  State<VerticalLineTracker> createState() => _VerticalLineTrackerState();
}

class _VerticalLineTrackerState extends State<VerticalLineTracker> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Delay so layout is complete
    WidgetsBinding.instance.addPostFrameCallback((_) => _reportYCoordinate());
  }

  void _reportYCoordinate() {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      final y = offset.dy;

      widget.onYCoordinateDetected(y);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      width: widget.width,
      height: widget.height,
      child: widget.child(),
    );
  }
}
