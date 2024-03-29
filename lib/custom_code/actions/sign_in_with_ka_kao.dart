
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'dart:convert';
import '../../auth/auth_util.dart';

Future<User> signInWithKaKao(BuildContext context) async {
  final signInFunc = () async {
    final clientState = const Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': 'de609d381d71df23e4a4d58d74439e6d',
      'response_mode': 'form_post',
      'redirect_uri':
      'https://woolen-stormy-scene.glitch.me/callbacks/kakao/sign_in',
      'scope': 'account_email profile_nickname profile_image',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
    final body = Uri
        .parse(result)
        .queryParameters;
    print(body["code"]);

    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': 'de609d381d71df23e4a4d58d74439e6d',
      'redirect_uri':
      'https://woolen-stormy-scene.glitch.me/callbacks/kakao/sign_in',
      'code': body["code"],
    });
    var responseTokens = await http.post(tokenUrl);
    Map<String, dynamic> bodys = json.decode(responseTokens.body);
    var response = await http.post(
        Uri.parse(
            'https://woolen-stormy-scene.glitch.me/callbacks/kakao/token'),
        body: {"accessToken": bodys['access_token']});
    return FirebaseAuth.instance.signInWithCustomToken(response.body);
  };
  return signInOrCreateAccount(context, signInFunc);
}
