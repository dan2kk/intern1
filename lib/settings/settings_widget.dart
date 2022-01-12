import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.secondaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '어플 설정',
          style: GoogleFonts.getFont(
            'Lexend Deca',
            color: Color(0xFF3F51B5),
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Text(
                      '아래에서 받을 알림을 선택하면 설정이 업데이트됩니다.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Lexend Deca',
                        color: FlutterFlowTheme.tertiaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: SwitchListTile.adaptive(
                value: switchListTileValue1 ??= true,
                onChanged: (newValue) =>
                    setState(() => switchListTileValue1 = newValue),
                title: Text(
                  '푸쉬 설정',
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                    color: Color(0xFF3F51B5),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  '애플리케이션으로부터 Push 알림을 반기별로 수신합니다.',
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                    color: Color(0xFF8B97A2),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                activeColor: Color(0xFF4B39EF),
                activeTrackColor: Color(0xFF3B2DB6),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: SwitchListTile.adaptive(
                value: switchListTileValue2 ??= true,
                onChanged: (newValue) =>
                    setState(() => switchListTileValue2 = newValue),
                title: Text(
                  '이메일 알람',
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                    color: Color(0xFF3F51B5),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  '마케팅 팀으로부터 새로운 기능에 대한 이메일 알림을 받으십시오.',
                  style: GoogleFonts.getFont(
                    'Lexend Deca',
                    color: Color(0xFF8B97A2),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                activeColor: Color(0xFF4B39EF),
                activeTrackColor: Color(0xFF3B2DB6),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(2),
                ),
                child: SwitchListTile.adaptive(
                  value: switchListTileValue3 ??= true,
                  onChanged: (newValue) =>
                      setState(() => switchListTileValue3 = newValue),
                  title: Text(
                    '위치 설정',
                    style: GoogleFonts.getFont(
                      'Lexend Deca',
                      color: Color(0xFF3F51B5),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  subtitle: Text(
                    '사용자의 위치를 추적할 수 있습니다. 이렇게 하면 지출 내역을 추적하고 안전하게 보호할 수 있습니다.',
                    style: GoogleFonts.getFont(
                      'Lexend Deca',
                      color: Color(0xFF8B97A2),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  activeColor: Color(0xFF4B39EF),
                  activeTrackColor: Color(0xFF3B2DB6),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: '설정 변경',
                options: FFButtonOptions(
                  width: 190,
                  height: 50,
                  color: Color(0xFF4B39EF),
                  textStyle: GoogleFonts.getFont(
                    'Lexend Deca',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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
    );
  }
}
