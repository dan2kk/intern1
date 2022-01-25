import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool switchListTileValue1;
  bool switchListTileValue2;
  bool switchListTileValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.99,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFF21B6FF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, -0.5),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.keyboard_arrow_left,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '알람 설정',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.title1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFFFBFBF6),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '아래에서 받을 알림을 선택하면 설정이 업데이트됩니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'tway_air medium',
                            color: FlutterFlowTheme.tertiaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: AuthUserStreamWidget(
                                  child: SwitchListTile.adaptive(
                                    value: switchListTileValue1 ??=
                                        currentUserDocument?.pushalarm,
                                    onChanged: (newValue) => setState(
                                            () => switchListTileValue1 = newValue),
                                    title: Text(
                                      '푸쉬 설정',
                                      style: TextStyle(
                                        fontFamily: 'tway_air medium',
                                        color: Color(0xFF21B6FF),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '애플리케이션으로부터 Push 알림을 반기별로 수신합니다.',
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    activeColor: Color(0xFF21B6FF),
                                    activeTrackColor: Color(0xFF21B6FF),
                                    dense: false,
                                    controlAffinity:
                                    ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(2),
                                  ),
                                  child: SwitchListTile.adaptive(
                                    value: switchListTileValue2 ??=
                                        currentUserDocument?.locationsetting,
                                    onChanged: (newValue) => setState(
                                            () => switchListTileValue2 = newValue),
                                    title: Text(
                                      '위치 설정',
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Color(0xFF21B6FF),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '사용자의 위치를 추적할 수 있습니다. 이렇게 하면 지출 내역을 추적하고 안전하게 보호할 수 있습니다.',
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    activeColor: Color(0xFF21B6FF),
                                    activeTrackColor: Color(0xFF21B6FF),
                                    dense: false,
                                    controlAffinity:
                                    ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (currentUserDocument?.emailalarm ?? true)
                              Expanded(
                                child: AuthUserStreamWidget(
                                  child: SwitchListTile.adaptive(
                                    value: switchListTileValue3 ??=
                                        currentUserDocument?.emailalarm,
                                    onChanged: (newValue) => setState(
                                            () => switchListTileValue3 = newValue),
                                    title: Text(
                                      '이메일 알람',
                                      style: TextStyle(
                                        fontFamily: 'tway_air medium',
                                        color: Color(0xFF21B6FF),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '마케팅 팀으로부터 새로운 기능에 대한 이메일 알림을 받으십시오.',
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    activeColor: Color(0xFF21B6FF),
                                    activeTrackColor: Color(0xFF21B6FF),
                                    dense: false,
                                    controlAffinity:
                                    ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final usersUpdateData = createUsersRecordData(
                      locationsetting: switchListTileValue2,
                      pushalarm: switchListTileValue1,
                      emailalarm: switchListTileValue3,
                    );
                    await currentUserReference.update(usersUpdateData);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(initialPage: 'MyPage'),
                      ),
                    );
                  },
                  text: '설정 변경',
                  options: FFButtonOptions(
                    width: 190,
                    height: 50,
                    color: Color(0xFF21B6FF),
                    textStyle: TextStyle(
                      fontFamily: 'tway_air medium',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 30,
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
