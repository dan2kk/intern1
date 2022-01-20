import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
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
      backgroundColor: Color(0xFFDBE2E7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Color(0xFF4B39EF),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 82,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 34, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                                Text(
                                  '포인트 내역',
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 4),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
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
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF8B97A2),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
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
                                            style: FlutterFlowTheme.title2
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF4B39EF),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 12),
                        child: Text(
                          '이번달',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AuthUserStreamWidget(
                    child: Builder(
                      builder: (context) {
                        final listofhistory = currentUserDocument?.pointHis?.reversed.toList() ?? [];
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
                                    height: 80,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      if ((rowPointsRecord.amount) > 0)
                                                        Align(
                                                          alignment: AlignmentDirectional(0, 0),
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * 0.2,
                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                            child: RiveAnimation.asset('assets/rive_animations/368-694-checkmark-icon.riv',
                                                              artboard:
                                                                  'Artboard',
                                                              fit: BoxFit.cover,
                                                              controllers:
                                                                  riveAnimationControllers1,
                                                            ),
                                                          ),
                                                        ),
                                                      if ((rowPointsRecord.amount) <= 0)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(0, 0),
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * 0.2,
                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                            child: RiveAnimation.asset('assets/rive_animations/369-695-error-icon.riv',
                                                              artboard: 'Artboard',
                                                              fit: BoxFit.cover,
                                                              controllers: riveAnimationControllers2,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        formatNumber(rowPointsRecord.amount, formatType: FormatType.decimal,),
                                                        style: FlutterFlowTheme.subtitle1.override(
                                                          fontFamily: 'Lexend Deca',
                                                          color: Color(0xFF15212B),
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(0.7, 0),
                                                          child: Text(dateTimeFormat('y년 MM월 dd일', rowPointsRecord.earnedDate),
                                                            textAlign: TextAlign.end,
                                                            style: TextStyle(
                                                              color: Color(0xFF57636C),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 4, 0),
                                                          child: Text(rowPointsRecord.reason,
                                                            style: FlutterFlowTheme.bodyText2.override(
                                                              fontFamily: 'Lexend Deca',
                                                              color: Color(0xFF8B97A2),
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(0.7, 0),
                                                          child: Text(dateTimeFormat('y년 MM월 dd일',
                                                                rowPointsRecord.expireDate),
                                                            textAlign: TextAlign.end,
                                                            style: TextStyle(
                                                              color: Color(0xFF57636C),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 10,
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
    );
  }
}
