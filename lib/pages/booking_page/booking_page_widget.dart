import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/time_slot_widget.dart';
import '/components/vertical_line_tracker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'booking_page_model.dart';
export 'booking_page_model.dart';

class BookingPageWidget extends StatefulWidget {
  const BookingPageWidget({
    super.key,
    required this.cafeRef,
  });

  final DocumentReference? cafeRef;

  static String routeName = 'bookingPage';
  static String routePath = '/bookingPage';

  @override
  State<BookingPageWidget> createState() => _BookingPageWidgetState();
}

class _BookingPageWidgetState extends State<BookingPageWidget> {
  late BookingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PricesRecord>>(
      stream: _model.cafePrices(
        requestFn: () => queryPricesRecord(
          queryBuilder: (pricesRecord) => pricesRecord.where(
            'cafeId',
            isEqualTo: widget.cafeRef,
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PricesRecord> bookingPagePricesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).alternate,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Booking Page',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 42.0, 0.0, 0.0),
                                child: Container(
                                  width: 110.0,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          Container(
                                            width: 10.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                          Container(
                                            width: 10.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 120.0,
                                              height: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final slotTime = functions
                                                          .generateTimeSlotsFromNow(
                                                              7,
                                                              _model
                                                                  .weekdayStartHour,
                                                              _model
                                                                  .weekdayEndHour,
                                                              _model
                                                                  .weekendStartHour,
                                                              _model
                                                                  .weekendEndHour)
                                                          ?.toList() ??
                                                      [];

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0.0),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: slotTime.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 0.0),
                                                    itemBuilder: (context,
                                                        slotTimeIndex) {
                                                      final slotTimeItem =
                                                          slotTime[
                                                              slotTimeIndex];
                                                      return Container(
                                                        width: 20.0,
                                                        height: 13.0,
                                                        child: custom_widgets
                                                            .SlotCenterDetector(
                                                          width: 20.0,
                                                          height: 13.0,
                                                          itemHeight: 13.0,
                                                          timeLabel:
                                                              slotTimeItem,
                                                          verticalLineY: _model
                                                              .verticalLineY,
                                                          onClosestSlotDetected:
                                                              (timeLabel) async {
                                                            _model.selectedTime =
                                                                slotTimeItem;
                                                            safeSetState(() {});
                                                          },
                                                          child: () =>
                                                              TimeSlotWidget(
                                                            weekdayStartHour: _model
                                                                .weekdayStartHour,
                                                            weekendStartHour: _model
                                                                .weekendStartHour,
                                                            parameter1:
                                                                slotTimeItem,
                                                            colour: functions.getSlotColor(
                                                                _model
                                                                    .lockedSlots
                                                                    .toList(),
                                                                _model
                                                                    .bookedSlots
                                                                    .toList(),
                                                                slotTimeItem),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 42.0),
                                          child: Container(
                                            width: 105.0,
                                            height: 3.0,
                                            child: custom_widgets
                                                .VerticalLineTracker(
                                              width: 105.0,
                                              height: 3.0,
                                              onYCoordinateDetected:
                                                  (yCoordinate) async {
                                                _model.verticalLineY =
                                                    yCoordinate;
                                                safeSetState(() {});
                                              },
                                              child: () =>
                                                  VerticalLineTrackerWidget(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 75.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 34.0, 0.0),
                              child: Container(
                                width: 120.0,
                                child: Builder(
                                  builder: (context) {
                                    final gameType = functions
                                        .getUniqueGameTypes(
                                            bookingPagePricesRecordList
                                                .toList())
                                        .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: gameType.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context, gameTypeIndex) {
                                        final gameTypeItem =
                                            gameType[gameTypeIndex];
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            _model.gameTypeSelected = (List<
                                                            String>
                                                        items,
                                                    int itemIndex) {
                                              return items[itemIndex];
                                            }(
                                                functions
                                                    .getUniqueGameTypes(
                                                        bookingPagePricesRecordList
                                                            .toList())
                                                    .toList(),
                                                gameTypeIndex);
                                            safeSetState(() {});
                                          },
                                          text: (int itemIndex,
                                                  List<String> items) {
                                            return items[itemIndex];
                                          }(
                                              gameTypeIndex,
                                              functions
                                                  .getUniqueGameTypes(
                                                      bookingPagePricesRecordList
                                                          .toList())
                                                  .toList()),
                                          options: FFButtonOptions(
                                            width: 60.0,
                                            height: 60.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: functions
                                                .getGameTypeButtonColorAtIndex(
                                                    bookingPagePricesRecordList
                                                        .toList(),
                                                    gameTypeIndex,
                                                    _model.gameTypeSelected),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 35.0, 14.0, 0.0),
                                  child: Container(
                                    width: 160.0,
                                    height: 65.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Time',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            (String? selectedTime) {
                                              return (() {
                                                if (selectedTime == null ||
                                                    selectedTime == '')
                                                  return 'No time';
                                                final parts =
                                                    selectedTime.split('_');
                                                if (parts.length != 2)
                                                  return 'No time';
                                                final dateStr = parts[0];
                                                final timeStr = parts[1];
                                                final year = int.parse(
                                                    dateStr.substring(0, 4));
                                                final month = int.parse(
                                                    dateStr.substring(4, 6));
                                                final day = int.parse(
                                                    dateStr.substring(6, 8));
                                                final hour = int.parse(
                                                    timeStr.substring(0, 2));
                                                final minute = int.parse(
                                                    timeStr.substring(2, 4));
                                                final dateTime = DateTime(year,
                                                    month, day, hour, minute);
                                                final weekdays = [
                                                  'Mon',
                                                  'Tue',
                                                  'Wed',
                                                  'Thu',
                                                  'Fri',
                                                  'Sat',
                                                  'Sun'
                                                ];
                                                final weekdayShort = weekdays[
                                                    dateTime.weekday - 1];
                                                final suffix =
                                                    hour >= 12 ? 'PM' : 'AM';
                                                final hour12 = hour % 12 == 0
                                                    ? 12
                                                    : hour % 12;
                                                final formattedTime =
                                                    '$hour12:${minute.toString().padLeft(2, '0')} $suffix';
                                                return '$weekdayShort $formattedTime';
                                              })();
                                            }(_model.selectedTime),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 14.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 160.0,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Controllers',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController1 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: functions
                                                        .getUniqueControllerCounts(
                                                            bookingPagePricesRecordList
                                                                .toList(),
                                                            _model
                                                                .gameTypeSelected)
                                                        .map(
                                                            (e) => e.toString())
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .dropDownValue1 =
                                                          val);
                                                      _model.controllers =
                                                          _model.dropDownValue1;
                                                      _model.totalPrice = functions
                                                          .selectedPriceCalculation(
                                                              bookingPagePricesRecordList
                                                                  .toList(),
                                                              _model.duration,
                                                              _model
                                                                  .controllers)!;
                                                      safeSetState(() {});
                                                      _model.timeSlotsSelected = functions
                                                          .getSelectableSlotsOrNull(
                                                              _model
                                                                  .selectedTime!,
                                                              _model.duration,
                                                              _model.lockedSlots
                                                                  .toList(),
                                                              _model.bookedSlots
                                                                  .toList())!
                                                          .toList()
                                                          .cast<String>();
                                                      safeSetState(() {});
                                                    },
                                                    width: 160.0,
                                                    height: 33.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .openSans(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintText: 'Select...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 160.0,
                                        height: 65.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Duration',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController2 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: functions
                                                        .getUniqueDurations(
                                                            bookingPagePricesRecordList
                                                                .toList(),
                                                            _model
                                                                .gameTypeSelected),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .dropDownValue2 =
                                                          val);
                                                      _model.duration =
                                                          _model.dropDownValue2;
                                                      _model.totalPrice = functions
                                                          .selectedPriceCalculation(
                                                              bookingPagePricesRecordList
                                                                  .toList(),
                                                              _model.duration,
                                                              _model
                                                                  .controllers)!;
                                                      safeSetState(() {});
                                                      _model.timeSlotsSelected = functions
                                                          .getSelectableSlotsOrNull(
                                                              _model
                                                                  .selectedTime!,
                                                              _model.duration,
                                                              _model.lockedSlots
                                                                  .toList(),
                                                              _model.bookedSlots
                                                                  .toList())!
                                                          .toList()
                                                          .cast<String>();
                                                      safeSetState(() {});
                                                    },
                                                    width: 160.0,
                                                    height: 33.0,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .openSans(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintText: 'Select...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 10.0))
                                        .addToEnd(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 25.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total Price: INR',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                functions
                                    .selectedPriceCalculation(
                                        bookingPagePricesRecordList.toList(),
                                        _model.dropDownValue2,
                                        _model.dropDownValue1)
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          _model.status = await actions.lockSlots(
                            functions
                                .generateTimeSlotsFromNow(1, 0, 24, 0, 24)!
                                .toList(),
                            currentUserUid,
                            widget.cafeRef!.id,
                            _model.gameTypeSelected!,
                          );

                          context.pushNamed(
                            CheckoutWidget.routeName,
                            queryParameters: {
                              'duration': serializeParam(
                                _model.dropDownValue2,
                                ParamType.String,
                              ),
                              'selectedTime': serializeParam(
                                _model.selectedTime,
                                ParamType.String,
                              ),
                              'cafeID': serializeParam(
                                widget.cafeRef,
                                ParamType.DocumentReference,
                              ),
                              'gameType': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'controllers': serializeParam(
                                '',
                                ParamType.String,
                              ),
                              'amount': serializeParam(
                                0.0,
                                ParamType.double,
                              ),
                            }.withoutNulls,
                          );

                          safeSetState(() {});
                        },
                        text: 'BOOK NOW',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      child: custom_widgets.RealtimeSlotListener(
                        width: 5.0,
                        height: 5.0,
                        cafeRef: widget.cafeRef!.id,
                        gameType: _model.gameTypeSelected,
                        slotType: 'locks',
                        onData: (slotList) async {
                          _model.lockedSlots =
                              slotList!.toList().cast<String>();
                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      child: custom_widgets.RealtimeSlotListener(
                        width: 5.0,
                        height: 5.0,
                        cafeRef: widget.cafeRef!.id,
                        gameType: _model.gameTypeSelected,
                        slotType: 'slots',
                        onData: (slotList) async {
                          _model.bookedSlots =
                              slotList!.toList().cast<String>();
                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
