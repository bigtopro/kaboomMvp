import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:flutter/material.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for LoginemailAddress widget.
  FocusNode? loginemailAddressFocusNode;
  TextEditingController? loginemailAddressTextController;
  String? Function(BuildContext, String?)?
      loginemailAddressTextControllerValidator;
  // State field(s) for Loginpassword widget.
  FocusNode? loginpasswordFocusNode;
  TextEditingController? loginpasswordTextController;
  late bool loginpasswordVisibility;
  String? Function(BuildContext, String?)? loginpasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    loginpasswordVisibility = false;
  }

  @override
  void dispose() {
    loginemailAddressFocusNode?.dispose();
    loginemailAddressTextController?.dispose();

    loginpasswordFocusNode?.dispose();
    loginpasswordTextController?.dispose();
  }
}
