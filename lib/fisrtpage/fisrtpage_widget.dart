import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FisrtpageWidget extends StatefulWidget {
  const FisrtpageWidget({Key key}) : super(key: key);

  @override
  _FisrtpageWidgetState createState() => _FisrtpageWidgetState();
}

class _FisrtpageWidgetState extends State<FisrtpageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF5C6EBE),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 300, 0, 0),
                child: Container(
                  width: 200,
                  height: 27,
                  decoration: BoxDecoration(
                    color: Color(0xFF5C6EBE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '수리가 필요한 모든 것엔',
                            style: TextStyle(
                              fontFamily: 'tway_air medium',
                              color: FlutterFlowTheme.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFF5C6EBE),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '딱따구리',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'tway_air medium',
                          color: FlutterFlowTheme.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 260, 0, 0),
                child: Container(
                  width: 200,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xFF5C6EBE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF5C6EBE),
                      )
                    ],
                    border: Border.all(
                      color: Color(0xFF5C6EBE),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: NavBarPage(initialPage: 'MainPage'),
                              ),
                            );
                          },
                          child: Text(
                            '           수리 시작하기',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'tway_air medium',
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: InkWell(
                  onDoubleTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: NavBarPage(initialPage: 'MainPage'),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: FlutterFlowTheme.tertiaryColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
