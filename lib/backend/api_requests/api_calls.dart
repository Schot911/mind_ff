import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class FfApiCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? date = '',
    String? timeStart = '',
    String? timeEnd = '',
    String? uid = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ffApi',
      apiUrl: 'https://n8n.mindchat.training/webhook-test/create_date',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
      },
      params: {
        'email': email,
        'date': date,
        'time_start': timeStart,
        'time_end': timeEnd,
        'token': token,
        'uid': uid,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }
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
