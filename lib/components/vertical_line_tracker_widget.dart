import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'vertical_line_tracker_model.dart';
export 'vertical_line_tracker_model.dart';

class VerticalLineTrackerWidget extends StatefulWidget {
  const VerticalLineTrackerWidget({super.key});

  @override
  State<VerticalLineTrackerWidget> createState() =>
      _VerticalLineTrackerWidgetState();
}

class _VerticalLineTrackerWidgetState extends State<VerticalLineTrackerWidget> {
  late VerticalLineTrackerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerticalLineTrackerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 105.0,
        height: 3.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
    );
  }
}
