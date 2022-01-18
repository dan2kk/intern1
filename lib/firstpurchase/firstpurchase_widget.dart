import 'dart:ffi';

import 'package:kpostal/kpostal.dart';
import '../auth/auth_util.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_complete/order_complete_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:bootpay_api/model/item.dart';
import 'package:kopo/kopo.dart';


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
  String radioButtonValue1;
  String radioButtonValue3;
  TextEditingController textController3;
  TextEditingController textController4;
  String radioButtonValue4;
  String radioButtonValue5;
  String radioButtonValue6;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';
  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
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
          backgroundColor: FlutterFlowTheme.tertiaryColor,
          body: SafeArea(
            child: Stack(
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
                                color: Color(0xFF3F51B5),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                          AlignmentDirectional(0, -0.5),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 20, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
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
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '수리 서비스 선택',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
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
                                  FlutterFlowRadioButton(
                                    options: ['픽업, 배송 수리(배달비 별도)', '방문수리(예약)'],
                                    onChanged: (value) {
                                      setState(() => radioButtonValue1 = value);
                                    },
                                    optionHeight: 25,
                                    textStyle:
                                    FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Playfair Display',
                                      color: Colors.black,
                                    ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor: Colors.blue,
                                    inactiveRadioButtonColor: Color(0x8A000000),
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '픽업 및 배달 정보',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: Text(
                                          '주소',
                                          style: FlutterFlowTheme.bodyText1
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 0, 0, 0),
                                           child: InkWell(
                                              onTap: () async {
                                                    await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                              builder: (_) => KpostalView(
                                                                  useLocalServer: false, // default is false
                                                                  localPort: 8080, // default is 8080
                                                                  kakaoKey: '10d8be79d5abf697db85adacc1079279', // if not declared, only use platform's geocoding
                                                                  callback: (Kpostal result){
                                                      setState(() {
                                                            this.postCode = result.postCode;
                                                            this.address = result.address;
                                                            this.latitude = result.latitude.toString();
                                                            this.longitude = result.longitude.toString();
                                                            this.kakaoLatitude =result.kakaoLatitude.toString();
                                                            this.kakaoLongitude = result.kakaoLongitude.toString();
                                                      });
                                                      },
                                                      ),
                                                    ),
                                                    );
                                              },
                                              child: Container(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * 0.8,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: Text(
                                                valueOrDefault(address, '클릭하여 주소를 입력하시요'),
                                                style: FlutterFlowTheme.title3.override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            )
                                          ),
                                        ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: Text(
                                          '연락처',
                                          style: FlutterFlowTheme.bodyText1
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 0, 0, 0),
                                            child: TextFormField(
                                              controller: textController2,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '전화번호를 입력하시오',
                                                hintStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4.0),
                                                    topRight:
                                                    Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4.0),
                                                    topRight:
                                                    Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '변경',
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: FlutterFlowRadioButton(
                                          options: ['안심번호 사용'],
                                          onChanged: (value) {
                                            setState(() =>
                                            radioButtonValue2 = value);
                                          },
                                          optionHeight: 25,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Playfair Display',
                                            color: Colors.black,
                                          ),
                                          selectedTextStyle: FlutterFlowTheme
                                              .bodyText1
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '픽업 요청 시간',
                                            style: FlutterFlowTheme.bodyText1
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
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await DatePicker.showDateTimePicker(
                                              context,
                                              showTitleActions: true,
                                              onConfirm: (date) {
                                                setState(
                                                        () => datePicked = date);
                                              },
                                              currentTime: getCurrentTimestamp,
                                              minTime: getCurrentTimestamp,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.95,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.05,
                                            decoration: BoxDecoration(
                                              color: Color(0x0EEEEEEE),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10, 0, 0, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'M/d h:mm a',
                                                          datePicked),
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color: Colors.black,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '요청 사항',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: Text(
                                          '수리기사님께',
                                          style: FlutterFlowTheme.bodyText1
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 0, 0, 0),
                                            child: TextFormField(
                                              controller: textController3,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '요청사항을 입력하시오',
                                                hintStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4.0),
                                                    topRight:
                                                    Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4.0),
                                                    topRight:
                                                    Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: FlutterFlowRadioButton(
                                          options: ['다음에도 사용'],
                                          onChanged: (value) {
                                            setState(() =>
                                            radioButtonValue3 = value);
                                          },
                                          optionHeight: 25,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Playfair Display',
                                            color: Colors.black,
                                          ),
                                          selectedTextStyle: FlutterFlowTheme
                                              .bodyText1
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '배달기사님께',
                                            style: FlutterFlowTheme.bodyText1
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                15, 0, 0, 0),
                                            child: TextFormField(
                                              controller: textController4,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '요청사항을 입력하시오',
                                                hintStyle: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4.0),
                                                    topRight:
                                                    Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  const BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4.0),
                                                    topRight:
                                                    Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: FlutterFlowRadioButton(
                                          options: ['다음에도 사용'],
                                          onChanged: (value) {
                                            setState(() =>
                                            radioButtonValue4 = value);
                                          },
                                          optionHeight: 25,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Playfair Display',
                                            color: Colors.black,
                                          ),
                                          selectedTextStyle: FlutterFlowTheme
                                              .bodyText1
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '결제수단 및 할인 적용',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: Text(
                                          '할인쿠폰',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Hello World',
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '딱따구리 포인트',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Hello World',
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '현급영수증',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              30, 0, 0, 0),
                                          child: FlutterFlowRadioButton(
                                            options: ['미친성'],
                                            onChanged: (value) {
                                              setState(() =>
                                              radioButtonValue5 = value);
                                            },
                                            optionHeight: 25,
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Playfair Display',
                                              color: Colors.black,
                                            ),
                                            selectedTextStyle: FlutterFlowTheme
                                                .bodyText1
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
                                        FlutterFlowRadioButton(
                                          options: ['신청'],
                                          onChanged: (value) {
                                            setState(() =>
                                            radioButtonValue6 = value);
                                          },
                                          optionHeight: 25,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Playfair Display',
                                            color: Colors.black,
                                          ),
                                          selectedTextStyle: FlutterFlowTheme
                                              .bodyText1
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            'Hello World',
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              30, 0, 0, 0),
                                          child: Text(
                                            '변경',
                                            style: FlutterFlowTheme.bodyText1,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 0, 0),
                                          child: Text(
                                            '결제 금액',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '수리 및 진단 예약 금액',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(70, 0, 0, 0),
                                                child: Text(
                                                  '30000원',
                                                  textAlign: TextAlign.justify,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Playfair Display',
                                                    color: Color(0xFF14181B),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
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
                                                '픽업 배달료',
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
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(150, 0, 0, 0),
                                                child: Text(
                                                  '6000원',
                                                  textAlign: TextAlign.end,
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
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '총 선결제금액',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(150, 0, 0, 0),
                                                child: Text(
                                                  'Hello World',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme
                                                      .bodyText1,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          color: Color(0xFF5C6EBE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await goBootpayRequest(context, 36000);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderCompleteWidget(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '결제하기',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
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
        );
      },
    );
  }
  void goBootpayRequest(BuildContext context, int amount) async {
    Payload payload = Payload();
    payload.androidApplicationId = '61d25a79e38c300022d2d6f2';
    payload.iosApplicationId = '61d25a79e38c300022d2d6f3';

    payload.pg = 'nicepay';
    payload.methods = ['card', 'phone', 'bank', 'easy'];
    payload.name = '가견적서 첫결제';
    payload.price = amount.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString()+ currentUserUid;


    User user = User();
    user.username = currentUserDisplayName;
    user.email = currentUserEmail;

    Extra extra = Extra();
    extra.appScheme = 'bootpaySample';

    Item item1 = Item();
    item1.itemName = "가견적& 수리예약"; // 주문정보에 담길 상품명
    item1.unique = "Repairment First purchase"; // 해당 상품의 고유 키
    item1.price = amount.toDouble(); // 상품의 가격

    List<Item> itemList = [item1];

    BootpayApi.request(
      context,
      payload,
      extra: extra,
      user: user,
      items: itemList,
      onDone: (String json) {
        print('onDone: $json');
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('onReady: $json');
      },
      onCancel: (String json) {
        print('onCancel: $json');
      },
      onError: (String json) {
        print('onError: $json');
      },
    );
  }
}
