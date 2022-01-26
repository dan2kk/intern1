import '../backend/backend.dart';
import '../coupon/coupon_widget.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_complete/order_complete_widget.dart';
import '../pointview/pointview_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstpurchaseWidget extends StatefulWidget {
  const FirstpurchaseWidget({
    Key key,
    this.repairmentrf,
  }) : super(key: key);

  final DocumentReference repairmentrf;

  @override
  _FirstpurchaseWidgetState createState() => _FirstpurchaseWidgetState();
}

class _FirstpurchaseWidgetState extends State<FirstpurchaseWidget> {
  DateTime datePicked;
  String radioButtonValue2;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  String radioButtonValue1;
  String radioButtonValue3;
  TextEditingController textController4;
  TextEditingController textController5;
  String radioButtonValue4;
  String radioButtonValue5;
  String radioButtonValue6;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RepairmentRecord>(
      stream: RepairmentRecord.getDocument(widget.repairmentrf),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: Color(0xFF2163CB),
            ),
          );
        }
        final firstpurchaseRepairmentRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFD3DDE1),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, -0.5),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          10, 0, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_left,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          20, 0, 0, 0),
                                                      child: Text(
                                                        '수리신청 및 결제',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.white,
                                                          fontSize: 25,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
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
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '수리 서비스 선택',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            FlutterFlowRadioButton(
                                              options: [
                                                '픽업, 배송 수리(배달비 별도)',
                                                '방문수리(예약)'
                                              ],
                                              onChanged: (value) {
                                                setState(() =>
                                                radioButtonValue1 = value);
                                              },
                                              optionHeight: 25,
                                              textStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                              selectedTextStyle:
                                              FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                              buttonPosition:
                                              RadioButtonPosition.left,
                                              direction: Axis.horizontal,
                                              radioButtonColor: Colors.blue,
                                              inactiveRadioButtonColor:
                                              Color(0x8A000000),
                                              toggleable: false,
                                              horizontalAlignment:
                                              WrapAlignment.start,
                                              verticalAlignment:
                                              WrapCrossAlignment.start,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '픽업 및 배달 정보',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '주소',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
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
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller: textController1,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: '주소를 입력하시오',
                                                      hintStyle:
                                                      FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                      enabledBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'tway_air medium',
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4B21B6FF),
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller: textController2,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: '상세 주소를 입력하시오',
                                                      hintStyle:
                                                      FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                      enabledBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'tway_air medium',
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '연락처',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4B21B6FF),
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15, 0,
                                                            0, 0),
                                                        child: TextFormField(
                                                          controller:
                                                          textController3,
                                                          obscureText: false,
                                                          decoration:
                                                          InputDecoration(
                                                            hintText:
                                                            '전화번호를 입력하시오',
                                                            hintStyle:
                                                            FlutterFlowTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'tway_air medium',
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              useGoogleFonts:
                                                              false,
                                                            ),
                                                            enabledBorder:
                                                            UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                    4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                    4.0),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                            UnderlineInputBorder(
                                                              borderSide:
                                                              BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                    4.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                    4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style:
                                                          FlutterFlowTheme
                                                              .bodyText1
                                                              .override(
                                                            fontFamily:
                                                            'tway_air medium',
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            useGoogleFonts:
                                                            false,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: FlutterFlowRadioButton(
                                                options: ['안심번호 사용'],
                                                onChanged: (value) {
                                                  setState(() =>
                                                  radioButtonValue2 =
                                                      value);
                                                },
                                                optionHeight: 25,
                                                textStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily:
                                                  'Playfair Display',
                                                  color: Colors.black,
                                                ),
                                                selectedTextStyle:
                                                FlutterFlowTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                buttonPosition:
                                                RadioButtonPosition.left,
                                                direction: Axis.vertical,
                                                radioButtonColor: Colors.blue,
                                                inactiveRadioButtonColor:
                                                Color(0x8A000000),
                                                toggleable: false,
                                                horizontalAlignment:
                                                WrapAlignment.start,
                                                verticalAlignment:
                                                WrapCrossAlignment.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '픽업 요청 시간',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontSize: 16,
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
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  await DatePicker
                                                      .showDateTimePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    onConfirm: (date) {
                                                      setState(() =>
                                                      datePicked = date);
                                                    },
                                                    currentTime:
                                                    getCurrentTimestamp,
                                                    minTime:
                                                    getCurrentTimestamp,
                                                  );
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.9,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                      0.06,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD3DDE1),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10,
                                                              0, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'M/d h:mm a',
                                                                datePicked),
                                                            style:
                                                            FlutterFlowTheme
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'tway_air medium',
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              useGoogleFonts:
                                                              false,
                                                            ),
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
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '요청 사항',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Color(0xFF5C6EBE),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '수리기사님께',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
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
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4B21B6FF),
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller: textController4,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: '요청사항을 입력하시오',
                                                      hintStyle:
                                                      FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                      enabledBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'tway_air medium',
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      useGoogleFonts: false,
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
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: FlutterFlowRadioButton(
                                                options: ['다음에도 사용'],
                                                onChanged: (value) {
                                                  setState(() =>
                                                  radioButtonValue3 =
                                                      value);
                                                },
                                                optionHeight: 25,
                                                textStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily:
                                                  'Playfair Display',
                                                  color: Colors.black,
                                                ),
                                                selectedTextStyle:
                                                FlutterFlowTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                buttonPosition:
                                                RadioButtonPosition.left,
                                                direction: Axis.vertical,
                                                radioButtonColor: Colors.blue,
                                                inactiveRadioButtonColor:
                                                Color(0x8A000000),
                                                toggleable: false,
                                                horizontalAlignment:
                                                WrapAlignment.start,
                                                verticalAlignment:
                                                WrapCrossAlignment.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '배달기사님께',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4B21B6FF),
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: TextFormField(
                                                    controller: textController5,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: '요청사항을 입력하시오',
                                                      hintStyle:
                                                      FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                      enabledBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                      UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                          Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(
                                                              4.0),
                                                          topRight:
                                                          Radius.circular(
                                                              4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'tway_air medium',
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      useGoogleFonts: false,
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
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: FlutterFlowRadioButton(
                                                options: ['다음에도 사용'],
                                                onChanged: (value) {
                                                  setState(() =>
                                                  radioButtonValue4 =
                                                      value);
                                                },
                                                optionHeight: 25,
                                                textStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily:
                                                  'Playfair Display',
                                                  color: Colors.black,
                                                ),
                                                selectedTextStyle:
                                                FlutterFlowTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                buttonPosition:
                                                RadioButtonPosition.left,
                                                direction: Axis.vertical,
                                                radioButtonColor: Colors.blue,
                                                inactiveRadioButtonColor:
                                                Color(0x8A000000),
                                                toggleable: false,
                                                horizontalAlignment:
                                                WrapAlignment.start,
                                                verticalAlignment:
                                                WrapCrossAlignment.start,
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
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '결제수단 및 할인 적용',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Color(0xFF5C6EBE),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(1, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '할인쿠폰',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.35,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(1, 0, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            CouponWidget(),
                                                      ),
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Hello World',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: Colors.black,
                                                        size: 30,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.6,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '딱따구리 포인트',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.35,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 3, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PointviewWidget(),
                                                        ),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Hello World',
                                                          style:
                                                          FlutterFlowTheme
                                                              .bodyText1
                                                              .override(
                                                            fontFamily:
                                                            'tway_air medium',
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            useGoogleFonts:
                                                            false,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_right,
                                                          color: Colors.black,
                                                          size: 30,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.5,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '현급영수증',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: FlutterFlowRadioButton(
                                                  options: ['미친성'],
                                                  onChanged: (value) {
                                                    setState(() =>
                                                    radioButtonValue5 =
                                                        value);
                                                  },
                                                  optionHeight: 25,
                                                  textStyle: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Playfair Display',
                                                    color: Colors.black,
                                                  ),
                                                  selectedTextStyle:
                                                  FlutterFlowTheme.bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                  buttonPosition:
                                                  RadioButtonPosition.left,
                                                  direction: Axis.vertical,
                                                  radioButtonColor: Colors.blue,
                                                  inactiveRadioButtonColor:
                                                  Color(0x8A000000),
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                  WrapAlignment.start,
                                                  verticalAlignment:
                                                  WrapCrossAlignment.start,
                                                ),
                                              ),
                                              FlutterFlowRadioButton(
                                                options: ['신청'],
                                                onChanged: (value) {
                                                  setState(() =>
                                                  radioButtonValue6 =
                                                      value);
                                                },
                                                optionHeight: 25,
                                                textStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily:
                                                  'Playfair Display',
                                                  color: Colors.black,
                                                ),
                                                selectedTextStyle:
                                                FlutterFlowTheme.bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                buttonPosition:
                                                RadioButtonPosition.left,
                                                direction: Axis.vertical,
                                                radioButtonColor: Colors.blue,
                                                inactiveRadioButtonColor:
                                                Color(0x8A000000),
                                                toggleable: false,
                                                horizontalAlignment:
                                                WrapAlignment.start,
                                                verticalAlignment:
                                                WrapCrossAlignment.start,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.9,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0x4B21B6FF),
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        'Hello World',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '결제 금액',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Color(0xFF5C6EBE),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.65,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '수리 및 진단 예약 금액',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 20, 0),
                                                      child: Text(
                                                        '30,000원',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
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
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.65,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '픽업 배달료',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 20, 0),
                                                      child: Text(
                                                        '6,000원',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
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
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.65,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '할인 금액',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 20, 0),
                                                      child: Text(
                                                        '',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
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
                                        Divider(
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.65,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          15, 0, 0, 0),
                                                      child: Text(
                                                        '총 선결제금액',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.06,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 0, 20, 0),
                                                      child: Text(
                                                        '36,000원',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.w500,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder<RepairmentRecord>(
                                      stream: RepairmentRecord.getDocument(
                                          widget.repairmentrf),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color: Color(0xFF2163CB),
                                            ),
                                          );
                                        }
                                        final containerRepairmentRecord =
                                            snapshot.data;
                                        return Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.95,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.1,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF21B6FF),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child:
                                          StreamBuilder<RepairmentRecord>(
                                            stream:
                                            RepairmentRecord.getDocument(
                                                widget.repairmentrf),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                  LinearProgressIndicator(
                                                    color: Color(0xFF2163CB),
                                                  ),
                                                );
                                              }
                                              final rowRepairmentRecord =
                                                  snapshot.data;
                                              return InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderCompleteWidget(),
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '결제하기',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
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
          ),
        );
      },
    );
  }
}
