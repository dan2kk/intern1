import 'package:intern1/secondpurchase/secondpurchase_widget.dart';

import '../backend/backend.dart';
import '../firstpurchase/firstpurchase_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_rive_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RepairmentDetailWidget extends StatefulWidget {
  const RepairmentDetailWidget({
    Key key,
    this.repairmentid,
  }) : super(key: key);

  final String repairmentid;

  @override
  _RepairmentDetailWidgetState createState() => _RepairmentDetailWidgetState();
}

class _RepairmentDetailWidgetState extends State<RepairmentDetailWidget> {
  final riveAnimationAnimationsList1 = [
    'Off',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers1 = [];
  final riveAnimationAnimationsList2 = [
    'On',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers2 = [];
  final riveAnimationAnimationsList3 = [
    'idle',
    'curves',
    'bounce',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers3 = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    riveAnimationAnimationsList1.forEach((name) {
      riveAnimationControllers1.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });

    riveAnimationAnimationsList2.forEach((name) {
      riveAnimationControllers2.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });

    riveAnimationAnimationsList3.forEach((name) {
      riveAnimationControllers3.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RepairmentRecord>>(
      stream: queryRepairmentRecord(
        queryBuilder: (repairmentRecord) => repairmentRecord
            .where('repairmentid', isEqualTo: widget.repairmentid),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: Color(0xFF2163CB),
            ),
          );
        }
        List<RepairmentRecord> repairmentDetailRepairmentRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final repairmentDetailRepairmentRecord =
        repairmentDetailRepairmentRecordList.isNotEmpty
            ? repairmentDetailRepairmentRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/16.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle
                ),
              )
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(55, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.05, 0.05),
                    child: Text(
                      '  상세 견적',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'tway_air medium',
                        color: Color(0xFF21B6FF),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.secondaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Stack(
                      children: [
                        if ((repairmentDetailRepairmentRecord.status) >= 6)
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: RiveAnimation.network(
                                'https://public.rive.app/community/runtime-files/1496-2978-cool-icon.riv',
                                artboard: 'New Artboard',
                                fit: BoxFit.cover,
                                controllers: riveAnimationControllers1,
                              ),
                            ),
                          ),
                        if ((repairmentDetailRepairmentRecord.status) < 6)
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: RiveAnimation.network(
                                'https://public.rive.app/community/runtime-files/1496-2978-cool-icon.riv',
                                artboard: 'New Artboard',
                                fit: BoxFit.cover,
                                controllers: riveAnimationControllers2,
                              ),
                            ),
                          ),
                        if ((repairmentDetailRepairmentRecord.status) == 3)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: RiveAnimation.asset(
                              'assets/rive_animations/3_-_truck.riv',
                              artboard: 'Truck',
                              fit: BoxFit.cover,
                              controllers: riveAnimationControllers3,
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 30, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.15,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  child: Image.asset(
                                                    'assets/images/KakaoTalk_20220104_094352388_03.png',
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.15,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    child: Image.asset(
                                                      'assets/images/KakaoTalk_20220104_094352388_02.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.15,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    child: Image.asset(
                                                      'assets/images/KakaoTalk_20220104_094352388.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.15,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    child: Image.asset(
                                                      'assets/images/KakaoTalk_20220104_094352388_05.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.15,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    child: Image.asset(
                                                      'assets/images/KakaoTalk_20220104_094352388_04.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.15,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30),
                                                    child: Image.asset(
                                                      'assets/images/KakaoTalk_20220104_094352388_01.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if ((repairmentDetailRepairmentRecord
                                                            .status) ==
                                                            1)
                                                          Text(
                                                            '수리 요청',
                                                            style:
                                                            FlutterFlowTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'tway_air medium',
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              fontSize: 11,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              useGoogleFonts:
                                                              false,
                                                            ),
                                                          ),
                                                        if ((repairmentDetailRepairmentRecord
                                                            .status) !=
                                                            1)
                                                          Text(
                                                            '수리 요청',
                                                            style:
                                                            FlutterFlowTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'tway_air medium',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              fontSize: 11,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              useGoogleFonts:
                                                              false,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00EEEEEE),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if ((repairmentDetailRepairmentRecord
                                                            .status) !=
                                                            2)
                                                          Text(
                                                            '견적 수락',
                                                            style:
                                                            FlutterFlowTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'tway_air medium',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              fontSize: 11,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              useGoogleFonts:
                                                              false,
                                                            ),
                                                          ),
                                                        if ((repairmentDetailRepairmentRecord
                                                            .status) ==
                                                            2)
                                                          Text(
                                                            '견적 수락',
                                                            style:
                                                            FlutterFlowTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'tway_air medium',
                                                              color: Color(
                                                                  0xFF4B39EF),
                                                              fontSize: 11,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              useGoogleFonts:
                                                              false,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if ((repairmentDetailRepairmentRecord
                                                              .status) ==
                                                              3)
                                                            Text(
                                                              '픽업',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: Color(
                                                                    0xFF4B39EF),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                useGoogleFonts:
                                                                false,
                                                              ),
                                                            ),
                                                          if ((repairmentDetailRepairmentRecord
                                                              .status) !=
                                                              3)
                                                            Text(
                                                              '픽업',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: FlutterFlowTheme
                                                                    .tertiaryColor,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                useGoogleFonts:
                                                                false,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(30, 0, 0, 0),
                                              child: Container(
                                                width: 70,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if ((repairmentDetailRepairmentRecord
                                                              .status) ==
                                                              4)
                                                            Text(
                                                              '수리 진행',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: Color(
                                                                    0xFF4B39EF),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                useGoogleFonts:
                                                                false,
                                                              ),
                                                            ),
                                                          if ((repairmentDetailRepairmentRecord
                                                              .status) !=
                                                              4)
                                                            Text(
                                                              '수리 진행',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: FlutterFlowTheme
                                                                    .tertiaryColor,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                useGoogleFonts:
                                                                false,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          if ((repairmentDetailRepairmentRecord
                                                              .status) ==
                                                              6)
                                                            Text(
                                                              '수리 완료',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: Color(
                                                                    0xFF21B6FF),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                useGoogleFonts:
                                                                false,
                                                              ),
                                                            ),
                                                          if ((repairmentDetailRepairmentRecord
                                                              .status) !=
                                                              6)
                                                            Text(
                                                              '수리 완료',
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: FlutterFlowTheme
                                                                    .tertiaryColor,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                useGoogleFonts:
                                                                false,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '현재 진행 상태',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'tway_air medium',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '주소',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                repairmentDetailRepairmentRecord.address,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '견적 일시',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              repairmentDetailRepairmentRecord.timestamp
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '픽업 여부',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Stack(
                                    children: [
                                      if (repairmentDetailRepairmentRecord
                                          .pickupDirect ??
                                          true)
                                        Text(
                                          '픽업서비스 이용',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      if (!(repairmentDetailRepairmentRecord
                                          .pickupDirect) ??
                                          true)
                                        Text(
                                          '직접방문',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                if (repairmentDetailRepairmentRecord
                                    .pickupDirect ??
                                    true)
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      dateTimeFormat(
                                          'M/d H:mm',
                                          repairmentDetailRepairmentRecord
                                              .select),
                                      style:
                                      FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'tway_air medium',
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '상품 사진',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                repairmentDetailRepairmentRecord.imgUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '제조사',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                repairmentDetailRepairmentRecord.manufacture,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '모델명',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                repairmentDetailRepairmentRecord.model,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '고장 부위',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              repairmentDetailRepairmentRecord.brokenPart,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '상세 설명',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              repairmentDetailRepairmentRecord.symptom,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if ((repairmentDetailRepairmentRecord.status) >= 2)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '수리점 코멘트',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                repairmentDetailRepairmentRecord.comment,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if ((repairmentDetailRepairmentRecord.status) >= 2)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '예상 수리기간',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${repairmentDetailRepairmentRecord.estDate.toString()}일 소요 예정',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


                  if ((repairmentDetailRepairmentRecord.status) >= 2)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '수리점 코멘트',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hello World',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if ((repairmentDetailRepairmentRecord.status) >= 2)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '비용',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${repairmentDetailRepairmentRecord.price.toString()}원 예정',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if ((repairmentDetailRepairmentRecord.status) >= 2)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            if ((repairmentDetailRepairmentRecord.status) == 3)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SecondpurchaseWidget(
                                              repairmentrf:
                                              repairmentDetailRepairmentRecord
                                                  .reference,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF21b6ff),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x55000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: FaIcon(
                                              FontAwesomeIcons.moneyBillWave,
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              size: 30,
                                            ),
                                          ),
                                          Text(
                                            '2차 견적서 확인후 결제하기',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
                                              color: Colors.white,
                                              fontSize: 16,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if ((repairmentDetailRepairmentRecord.status) == 2)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 20),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FirstpurchaseWidget(
                                              repairmentrf:
                                              repairmentDetailRepairmentRecord
                                                  .reference,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF21b6ff),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x55000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: FaIcon(
                                              FontAwesomeIcons.moneyBillWave,
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              size: 30,
                                            ),
                                          ),
                                          Text(
                                            '1차 가견적서 결제하기',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
                                              color: Colors.white,
                                              fontSize: 18,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
