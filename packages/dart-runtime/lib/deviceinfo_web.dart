import 'dart:js_interop';

import 'package:web/web.dart' as web;

@JS('Intl.DateTimeFormat')
external _DateTimeFormat _dateTimeFormat();

extension type _DateTimeFormat._(JSObject _) implements JSObject {
  external _ResolvedOptions resolvedOptions();
}

extension type _ResolvedOptions._(JSObject _) implements JSObject {
  external String? get timeZone;
}

Future<Map<String, Object?>> getDeviceInfo(String deviceId) async {
  // Intl.DateTimeFormat().resolvedOptions().timeZone
  String? timeZoneName;
  try {
    timeZoneName = _dateTimeFormat().resolvedOptions().timeZone;
  } catch (_) {}

  return {
    'id': deviceId,
    'language': web.window.navigator.language,
    'platform': {'browserUserAgent': web.window.navigator.userAgent},
    'timezone': timeZoneName ?? DateTime.now().timeZoneName,
    'type': 'web',
    'version':
        (web.document.currentScript as web.Element?)?.getAttribute('src') ?? ''
  };
}
