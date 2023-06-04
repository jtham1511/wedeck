import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/check_out_page/check_out_page_widget.dart';
import '/components/cart_entry_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cart02Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  double? cartTotal;

  double? gstTotal;

  double? grandTotal;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - orderGenerator] action in Container widget.
  String? orderIdGenerated;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
