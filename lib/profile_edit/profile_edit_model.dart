import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileEditModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for emailaddress widget.
  TextEditingController? emailaddressController;
  String? Function(BuildContext, String?)? emailaddressControllerValidator;
  // State field(s) for contact_number widget.
  TextEditingController? contactNumberController;
  final contactNumberMask = MaskTextInputFormatter(mask: '+##################');
  String? Function(BuildContext, String?)? contactNumberControllerValidator;
  // State field(s) for company widget.
  TextEditingController? companyController;
  String? Function(BuildContext, String?)? companyControllerValidator;
  // State field(s) for member_id widget.
  TextEditingController? memberIdController;
  String? Function(BuildContext, String?)? memberIdControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameController?.dispose();
    emailaddressController?.dispose();
    contactNumberController?.dispose();
    companyController?.dispose();
    memberIdController?.dispose();
  }

  /// Additional helper methods are added here.

}
