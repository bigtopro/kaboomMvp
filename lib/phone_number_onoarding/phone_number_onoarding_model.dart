import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_number_onoarding_widget.dart' show PhoneNumberOnoardingWidget;
import 'package:flutter/material.dart';

class PhoneNumberOnoardingModel
    extends FlutterFlowModel<PhoneNumberOnoardingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for unformattedPhoneNumber widget.
  FocusNode? unformattedPhoneNumberFocusNode;
  TextEditingController? unformattedPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      unformattedPhoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    unformattedPhoneNumberFocusNode?.dispose();
    unformattedPhoneNumberTextController?.dispose();
  }
}
