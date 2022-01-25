import 'package:intern1/pointview/pointview_widget.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_complete/order_complete_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/auth_util.dart';
import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:bootpay_api/model/item.dart';

import 'package:intern1/coupon/coupon_widget.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';


class SecondpurchaseWidget extends StatefulWidget {

  const SecondpurchaseWidget({
    Key key,
    this.repairmentrf,
  }) : super(key: key);

  final DocumentReference repairmentrf;

  @override
  _SecondpurchaseWidgetState createState() => _SecondpurchaseWidgetState();
}

class _SecondpurchaseWidgetState extends State<SecondpurchaseWidget> {
  String radioButtonValue1;
  String radioButtonValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        final secondpurchaseRepairmentRecord = snapshot.data;
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, -0.5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                child: Text(
                                                  '추가견적 확인',
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                              height: MediaQuery.of(context).size.height * 0.05,
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
                                            '현장 진단 후 발생한 견적서가 도착했습니다',
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
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.95,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                secondpurchaseRepairmentRecord
                                                    .manufacture,
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
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.95,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                secondpurchaseRepairmentRecord
                                                    .model,
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
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.95,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '진단 접수 일시 : ',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              secondpurchaseRepairmentRecord
                                                  .timestamp
                                                  .toString(),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.95,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    '증상',
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        15, 0, 0, 0),
                                                    child: Text(
                                                      secondpurchaseRepairmentRecord
                                                          .symptom,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
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
                                color: Color(0xFFF5F5F5),
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
                                            secondpurchaseRepairmentRecord
                                                .manufacture,
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
                                  Divider(
                                    height: 20,
                                    thickness: 1,
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.black,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.95,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.2,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 10, 0, 0),
                                              child: Text(
                                                'Hello World',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '예상 수리 기간',
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
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: Text(
                                                  secondpurchaseRepairmentRecord
                                                      .estDate
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    fontSize: 16,
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '예상 견적',
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
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: Text(
                                                  secondpurchaseRepairmentRecord
                                                      .price
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    fontSize: 16,
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
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
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
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.6,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              1, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '할인쿠폰',
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
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.35,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              1, 0, 0, 0),
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Hello World',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '딱따구리 포인트',
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
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 3, 0, 0),
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                    Icons.keyboard_arrow_right,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '현급영수증',
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
                                              10, 0, 0, 0),
                                          child: FlutterFlowRadioButton(
                                            options: ['미친성'],
                                            onChanged: (value) {
                                              setState(() =>
                                              radioButtonValue1 = value);
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
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  'Hello World',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    fontSize: 16,
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
                                color: Color(0xFFF5F5F5),
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
                                            '결제금액',
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
                                    height: 20,
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
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.65,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '견적 금액',
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
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.3,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: Text(
                                                '',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.65,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '진단 예약 금액',
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
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.3,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '-',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: Text(
                                                '30,000',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.65,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '추가 결제금액',
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
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.3,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: Text(
                                                '',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  fontSize: 16,
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
                          color: Color(0xFF21B6FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await goBootpayRequest(context, 2500000);
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

