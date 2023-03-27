import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login/login_widget.dart';
import '/main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for username widget.
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  // State field(s) for contactnumber widget.
  TextEditingController? contactnumberController;
  String? Function(BuildContext, String?)? contactnumberControllerValidator;
  // State field(s) for companyname widget.
  TextEditingController? companynameController;
  String? Function(BuildContext, String?)? companynameControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordconfirm widget.
  TextEditingController? passwordconfirmController;
  late bool passwordconfirmVisibility;
  String? Function(BuildContext, String?)? passwordconfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordconfirmVisibility = false;
  }

  void dispose() {
    emailAddressController?.dispose();
    usernameController?.dispose();
    contactnumberController?.dispose();
    companynameController?.dispose();
    passwordController?.dispose();
    passwordconfirmController?.dispose();
  }

  /// Additional helper methods are added here.

}
