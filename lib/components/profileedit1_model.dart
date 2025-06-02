import '/flutter_flow/flutter_flow_util.dart';
import 'profileedit1_widget.dart' show Profileedit1Widget;
import 'package:flutter/material.dart';

class Profileedit1Model extends FlutterFlowModel<Profileedit1Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EditUsername widget.
  FocusNode? editUsernameFocusNode;
  TextEditingController? editUsernameTextController;
  String? Function(BuildContext, String?)? editUsernameTextControllerValidator;
  // State field(s) for EditEmail widget.
  FocusNode? editEmailFocusNode;
  TextEditingController? editEmailTextController;
  String? Function(BuildContext, String?)? editEmailTextControllerValidator;
  // State field(s) for EditPhoneNumber widget.
  FocusNode? editPhoneNumberFocusNode;
  TextEditingController? editPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      editPhoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editUsernameFocusNode?.dispose();
    editUsernameTextController?.dispose();

    editEmailFocusNode?.dispose();
    editEmailTextController?.dispose();

    editPhoneNumberFocusNode?.dispose();
    editPhoneNumberTextController?.dispose();
  }
}
