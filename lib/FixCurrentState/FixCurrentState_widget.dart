import '../flutter_flow/flutter_flow_rive_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../repairment_detail/repairment_detail_widget.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FixCurrentStateWidget extends StatefulWidget {
  const FixCurrentStateWidget({
    Key key,
    this.repairmentid0,
  }) : super(key: key);

  final String repairmentid0;

  @override
  _FixCurrentStateWidgetState createState() => _FixCurrentStateWidgetState();
}

class _FixCurrentStateWidgetState extends State<FixCurrentStateWidget> {
  final riveAnimationAnimationsList = [
    'Off',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    riveAnimationAnimationsList.forEach((name) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        '수리 진행 현황',
                                        style:
                                        FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'tway_air medium',
                                          color: Colors.white,
                                          fontSize: 25,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      child: RiveAnimation.network(
                        'https://public.rive.app/community/runtime-files/1496-2978-cool-icon.riv',
                        artboard: 'New Artboard',
                        fit: BoxFit.cover,
                        controllers: riveAnimationControllers,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RepairmentDetailWidget(
                                repairmentid: widget.repairmentid0,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          '수리 요청 및 결제 완료',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'tway_air medium',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '픽업 (수리점으로 이동',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'tway_air medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '견적서 발송',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'tway_air medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '수리 진행',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'tway_air medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '수리 완료',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'tway_air medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '픽업(집으로 이동)',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'tway_air medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: Color(0xFFD3DDE1),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '배달 완료',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'tway_air medium',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepairmentDetailWidget(
                              repairmentid: widget.repairmentid0,
                            ),
                          ),
                        );
                      },
                      text: '상세 견적 보기',
                      options: FFButtonOptions(
                        width: 130,
                        height: 50,
                        color: Color(0xFF21B6FF),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'tway_air medium',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
