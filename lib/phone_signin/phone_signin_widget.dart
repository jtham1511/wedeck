import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sms_code/sms_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_signin_model.dart';
export 'phone_signin_model.dart';

class PhoneSigninWidget extends StatefulWidget {
  const PhoneSigninWidget({Key? key}) : super(key: key);

  @override
  _PhoneSigninWidgetState createState() => _PhoneSigninWidgetState();
}

class _PhoneSigninWidgetState extends State<PhoneSigninWidget>
    with TickerProviderStateMixin {
  late PhoneSigninModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1680.ms,
          begin: 0.0,
          end: 4.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneSigninModel());

    _model.phoneNumberController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Phone Sign In',
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 60.0),
                child: Image.asset(
                  'assets/images/WeDeck-beta.png',
                  width: 140.0,
                  height: 180.0,
                  fit: BoxFit.contain,
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ),
              Container(
                height: 200.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                      child: Text(
                        'Type in your phone number below to register.',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: TextFormField(
                          controller: _model.phoneNumberController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Your Phone Number',
                            labelStyle: FlutterFlowTheme.of(context).bodySmall,
                            hintText: 'Please enter a valid number...',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 20.0, 24.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0F1113),
                                    fontWeight: FontWeight.w600,
                                  ),
                          maxLines: null,
                          keyboardType: TextInputType.phone,
                          validator: _model.phoneNumberControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
            child: FFButtonWidget(
              onPressed: () async {
                final phoneNumberVal = _model.phoneNumberController.text;
                if (phoneNumberVal == null ||
                    phoneNumberVal.isEmpty ||
                    !phoneNumberVal.startsWith('+')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Phone Number is required and has to start with +.'),
                    ),
                  );
                  return;
                }
                await beginPhoneAuth(
                  context: context,
                  phoneNumber: phoneNumberVal,
                  onCodeSent: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SmsCodeWidget(),
                      ),
                      (r) => false,
                    );
                  },
                );
              },
              text: 'Sign In with Phone',
              options: FFButtonOptions(
                width: 230.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).black600,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
