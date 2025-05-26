import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_slot_model.dart';
export 'time_slot_model.dart';

class TimeSlotWidget extends StatefulWidget {
  const TimeSlotWidget({
    super.key,
    this.parameter1,
    int? weekdayStartHour,
    int? weekendStartHour,
  })  : this.weekdayStartHour = weekdayStartHour ?? 0,
        this.weekendStartHour = weekendStartHour ?? 0;

  final String? parameter1;
  final int weekdayStartHour;
  final int weekendStartHour;

  @override
  State<TimeSlotWidget> createState() => _TimeSlotWidgetState();
}

class _TimeSlotWidgetState extends State<TimeSlotWidget> {
  late TimeSlotModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeSlotModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if ((String slotTime) {
            return slotTime.split('_')[1].substring(2, 4) == '00';
          }(widget.parameter1!))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Text(
                (String slotTime, int weekdayStartHour, int weekendStartHour) {
                  return (() {
                    final parts = slotTime.split('_');
                    if (parts.length != 2) return 'No time';
                    final date = parts[0];
                    final time = parts[1];
                    final year = int.parse(date.substring(0, 4));
                    final month = int.parse(date.substring(4, 6));
                    final day = int.parse(date.substring(6, 8));
                    final hour = int.parse(time.substring(0, 2));
                    final minute = int.parse(time.substring(2, 4));
                    final wd = DateTime(year, month, day).weekday;
                    final isWknd = wd == 6 || wd == 7;
                    final sHour = isWknd ? weekendStartHour : weekdayStartHour;
                    final ampm = hour >= 12 ? 'PM' : 'AM';
                    final h12 = (hour % 12 == 0) ? 12 : hour % 12;
                    final m = minute.toString().padLeft(2, '0');
                    final d = (wd == 1)
                        ? 'Mon'
                        : (wd == 2)
                            ? 'Tue'
                            : (wd == 3)
                                ? 'Wed'
                                : (wd == 4)
                                    ? 'Thu'
                                    : (wd == 5)
                                        ? 'Fri'
                                        : (wd == 6)
                                            ? 'Sat'
                                            : 'Sun';
                    return (hour == sHour && minute == 0)
                        ? '$d $h12:$m$ampm'
                        : '$h12:$m$ampm';
                  })();
                }(widget.parameter1!, widget.weekdayStartHour,
                    widget.weekendStartHour),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: Container(
              width: 10.0,
              height: 13.0,
              decoration: BoxDecoration(
                color: (String slotTime) {
                  return slotTime.split('_')[1].substring(2, 4) == '00'
                      ? Color(0xFF010002)
                      : Color(0xFF6A03F3);
                }(widget.parameter1!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
