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

class SlotCenterDetector extends StatefulWidget {
  const SlotCenterDetector({
    super.key,
    this.width,
    this.height,
    this.child,
    this.itemHeight,
    this.timeLabel,
    this.verticalLineY,
    this.onClosestSlotDetected,
  });

  final double? width;
  final double? height;
  final Widget Function()? child;
  final double? itemHeight;
  final String? timeLabel;
  final double? verticalLineY;
  final Future Function(String timeLabel)? onClosestSlotDetected;

  @override
  State<SlotCenterDetector> createState() => _SlotCenterDetectorState();
}

class _SlotCenterDetectorState extends State<SlotCenterDetector> {
  final GlobalKey _key = GlobalKey();
  bool _hasBeenCalled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if (mounted) _checkProximityToLine();
    });
  }

  void _checkProximityToLine() {
    if (widget.verticalLineY == null || widget.itemHeight == null) return;

    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final itemOffset = renderBox.localToGlobal(Offset.zero).dy;
      final itemCenter = itemOffset + widget.itemHeight! / 2;
      final diff = (itemCenter - widget.verticalLineY!).abs();

      const double threshold = 6.5;

      if (diff <= threshold && !_hasBeenCalled) {
        _hasBeenCalled = true;
        if (widget.onClosestSlotDetected != null && widget.timeLabel != null) {
          widget.onClosestSlotDetected!(widget.timeLabel!);
        }
      } else if (diff > threshold) {
        _hasBeenCalled = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      width: widget.width,
      height: widget.height ?? widget.itemHeight,
      child: widget.child != null ? widget.child!() : const SizedBox(),
    );
  }
}
