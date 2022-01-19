import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intern1/store_list_new/store_list_new_widget.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:intern1/fisrtpage/fisrtpage_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'main_page/main_page_widget.dart';
import 'favorite/favorite_widget.dart';
import 'fix_history/fix_history_widget.dart';
import 'my_page/my_page_widget.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
11
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<Intern1FirebaseUser> userStream;
  Intern1FirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = intern1FirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 3), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'intern1',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/initial.png',
                  fit: BoxFit.none,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : FisrtpageWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'MainPage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'MainPage': MainPageWidget(),
      'Favorite': FavoriteWidget(),
      'FixHistory': StoreListNewWidget(),
      'MyPage': MyPageWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/09.png'),
              size: 26,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/09.png'),
              size: 30,
            ),
            label: '메인화면',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/10.png'),
              size: 26,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/10.png'),
              size: 30,
            ),
            label: '즐겨찾기',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/11.png'),
              size: 26,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/11.png'),
              size: 30,
            ),
            label: '수리내역',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/12.png'),
              size: 26,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/12.png'),
              size: 30,
            ),
            label: '마이페이지',
            tooltip: '',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF21B6FF),
        unselectedItemColor: FlutterFlowTheme.tertiaryColor,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
