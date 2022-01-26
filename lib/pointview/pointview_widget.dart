import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_rive_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PointviewWidget extends StatefulWidget {
  const PointviewWidget({Key key}) : super(key: key);

  @override
  _PointviewWidgetState createState() => _PointviewWidgetState();
}

class _PointviewWidgetState extends State<PointviewWidget> {
  final riveAnimationAnimationsList1 = [
    'show',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers1 = [];
  final riveAnimationAnimationsList2 = [
    'show',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers2 = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    riveAnimationAnimationsList1.forEach((name) {
      riveAnimationControllers1.add(FlutterFlowRiveController(
        name,
      ));
    });

    riveAnimationAnimationsList2.forEach((name) {
      riveAnimationControllers2.add(FlutterFlowRiveController(
        name,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
                                      '포인트 내역',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.97,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '포인트',
                                          style: FlutterFlowTheme.bodyText2
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Color(0xFF8B97A2),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 8),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          formatNumber(
                                            currentUserDocument?.point,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                            DecimalType.periodDecimal,
                                          ),
                                          style:
                                          FlutterFlowTheme.title2.override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF21B6FF),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                      color: Color(0xFF21B6FF),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.03,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              border: Border.all(
                                color: Color(0xFFF5F5F5),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    'This Month',
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'tway_air medium',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AuthUserStreamWidget(
                      child: Builder(
                        builder: (context) {
                          final listofhistory =
                              currentUserDocument?.pointHis?.toList() ?? [];
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(listofhistory.length,
                                      (listofhistoryIndex) {
                                    final listofhistoryItem =
                                    listofhistory[listofhistoryIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            border: Border.all(
                                              color: Color(0xFFC8CED5),
                                              width: 1,
                                            ),
                                          ),
                                          child: StreamBuilder<PointsRecord>(
                                            stream: PointsRecord.getDocument(
                                                listofhistoryItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: LinearProgressIndicator(
                                                    color: Color(0xFF2163CB),
                                                  ),
                                                );
                                              }
                                              final rowPointsRecord = snapshot.data;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            0.25,
                                                        height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                            0.1,
                                                        child: Stack(
                                                          children: [
                                                            if ((rowPointsRecord
                                                                .amount) >
                                                                0)
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                                child: Container(
                                                                  width: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width *
                                                                      0.9,
                                                                  height: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .height *
                                                                      0.9,
                                                                  child:
                                                                  RiveAnimation
                                                                      .asset(
                                                                    'assets/rive_animations/368-694-checkmark-icon.riv',
                                                                    artboard:
                                                                    'Artboard',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    controllers:
                                                                    riveAnimationControllers1,
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((rowPointsRecord
                                                                .amount) <=
                                                                0)
                                                              Align(
                                                                alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                                child: Container(
                                                                  width: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width *
                                                                      0.9,
                                                                  height: MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .height *
                                                                      0.9,
                                                                  child:
                                                                  RiveAnimation
                                                                      .asset(
                                                                    'assets/rive_animations/369-695-error-icon.riv',
                                                                    artboard:
                                                                    'Artboard',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    controllers:
                                                                    riveAnimationControllers2,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width *
                                                                  0.35,
                                                              height: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .height *
                                                                  0.03,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Text(
                                                                    formatNumber(
                                                                      rowPointsRecord
                                                                          .amount,
                                                                      formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .subtitle1
                                                                        .override(
                                                                      fontFamily:
                                                                      'tway_air medium',
                                                                      color: Color(
                                                                          0xFF15212B),
                                                                      fontSize: 18,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                      useGoogleFonts:
                                                                      false,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width *
                                                                  0.35,
                                                              height: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .height *
                                                                  0.03,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Align(
                                                                      alignment:
                                                                      AlignmentDirectional(
                                                                          0.7,
                                                                          0),
                                                                      child: Text(
                                                                        dateTimeFormat(
                                                                            'yMd',
                                                                            rowPointsRecord
                                                                                .earnedDate),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                        style:
                                                                        TextStyle(
                                                                          fontFamily:
                                                                          'tway_air medium',
                                                                          color: Color(
                                                                              0xFF57636C),
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                          12,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width *
                                                                  0.35,
                                                              height: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .height *
                                                                  0.05,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                      child: Text(
                                                                        rowPointsRecord
                                                                            .reason,
                                                                        style: FlutterFlowTheme
                                                                            .bodyText2
                                                                            .override(
                                                                          fontFamily:
                                                                          'tway_air medium',
                                                                          color: Color(
                                                                              0xFF000000),
                                                                          fontSize:
                                                                          12,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          useGoogleFonts:
                                                                          false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width *
                                                                  0.35,
                                                              height: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .height *
                                                                  0.05,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Align(
                                                                      alignment:
                                                                      AlignmentDirectional(
                                                                          0.7,
                                                                          0),
                                                                      child: Text(
                                                                        dateTimeFormat(
                                                                            'yMd',
                                                                            rowPointsRecord
                                                                                .expireDate),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                        style:
                                                                        TextStyle(
                                                                          color: Color(
                                                                              0xFF57636C),
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          fontSize:
                                                                          12,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
