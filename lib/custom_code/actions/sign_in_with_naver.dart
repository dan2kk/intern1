// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import '../../auth/auth_util.dart';
Future<User> signInWithNaver(BuildContext context) async {
  final signInFunc = () async {
    final clientState = Uuid().v4();
    final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
      'response_type': 'code',
      'client_id': 'KvW3GQfUlcTf6XDGrCGR',
      'redirect_uri':
      'https://woolen-stormy-scene.glitch.me/callbacks/naver_auth/sign_in',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");
    final body = Uri
        .parse(result)
        .queryParameters;

    final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
      'grant_type': 'authorization_code',
      'client_id': 'KvW3GQfUlcTf6XDGrCGR',
      'client_secret': 'GibFLh8iTi',
      'code': body["code"],
      'state': clientState,
    });
    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        Uri.parse(
            'https://woolen-stormy-scene.glitch.me/callbacks/naver_auth/token'),
        body: {"accessToken": bodys['access_token']});
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  };
  return signInOrCreateAccount(context, signInFunc);
}
