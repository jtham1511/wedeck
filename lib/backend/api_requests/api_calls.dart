import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MemberQRCodeCall {
  static Future<ApiCallResponse> call({
    String? memberID = '',
  }) {
    final body = '''
{
  "apikey": "NCJDR9dKvgiXsGfokZY3",
  "data": "${memberID}",
  "transparent": "off",
  "frontcolor": "#000000",
  "marker_out_color": "#000000",
  "marker_in_color": "#000000",
  "pattern": "default",
  "marker": "default",
  "marker_in": "default",
  "qrtype": "dynamic",
  "optionlogo": "none"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'memberQRCode',
      apiUrl: 'https://api.qr.io/v1/create',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic qrImagePath(dynamic response) => getJsonField(
        response,
        r'''$.png''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
