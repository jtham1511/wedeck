import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFFE4DB47),
          child: Center(
            child: Image.asset(
              'assets/images/WeDeck-logo.png',
              width: 250.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'login_01': (data) async => Login01Widget(),
  'create_accCopy': (data) async => CreateAccCopyWidget(),
  'splash': (data) async => SplashWidget(),
  'forgot': (data) async => ForgotWidget(),
  'personal_details': (data) async =>
      NavBarPage(initialPage: 'personal_details'),
  'spanish_walnut_product': (data) async => SpanishWalnutProductWidget(),
  'G1FlutedDarkEbony': (data) async => G1FlutedDarkEbonyWidget(),
  'G1FlutedSilverFir': (data) async => G1FlutedSilverFirWidget(),
  'G1FlutedWalnutwpc': (data) async => G1FlutedWalnutwpcWidget(),
  'MagellanRomanAntique': (data) async => MagellanRomanAntiqueWidget(),
  'MagellanPeruvianTeak': (data) async => MagellanPeruvianTeakWidget(),
  'ChengalCeiling': (data) async => ChengalCeilingWidget(),
  'product_list': (data) async => NavBarPage(initialPage: 'product_list'),
  'product_listing2': (data) async =>
      NavBarPage(initialPage: 'product_listing2'),
  'profile_edit': (data) async => ProfileEditWidget(),
  'my_qr': (data) async => NavBarPage(initialPage: 'my_qr'),
  'login': (data) async => LoginWidget(),
  'privacy': (data) async => PrivacyWidget(),
  'S3W5BrasilianWalnut': (data) async => S3W5BrasilianWalnutWidget(),
  'S3W6BrasilianEbony': (data) async => S3W6BrasilianEbonyWidget(),
  'SolidOakSkirting': (data) async => SolidOakSkirtingWidget(),
  'sms_code': (data) async => SmsCodeWidget(),
  'phone_signin': (data) async => PhoneSigninWidget(),
  'close_account': (data) async => CloseAccountWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
