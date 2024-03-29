import 'package:intern1/pointview/pointview_widget.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_complete/order_complete_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
  String radioButtonValue1;   //현금영수증 미신청
  String radioButtonValue2;   //현금영수증 신청
  int defaultPrice = 30000;
  int alreadyPrice = 6000;
  int discountAll = 0;
  int finalPrice = 36000;
  int discountCoupon = 0;
  int discountPoint = 0;
  int result;
  int pointHave = currentUserDocument.point ?? 0;
  String input = '';
  bool _submitted = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  DocumentReference<CouponRecord> coupon = null;
  TextEditingController controller;
  String copNum = '';
  void _submit() {
    // set this variable to true when we try to submit
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() { _submitted = true;
      discountPoint = int.parse(input);
      discountAll = discountCoupon + discountPoint;
      finalPrice = defaultPrice - alreadyPrice - discountAll;});
      Navigator.pop(context);
      print('1');
    }
  }
  Future<String> openDialog() => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: new Text("포인트 사용"),
        content: new Text("사용할 포인트를 입력해 주세요!\n 현재 포인트: $pointHave"),
        actions: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.card_giftcard_sharp),
                      hintText: '보유한 포인트내에서 입력',
                      labelText: '포인트 *',
                    ),
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '빈칸일수는 없습니다!';
                      }
                      if (int.parse(value) > pointHave) {
                        return '가진 포인트보다 더 많이 사용할수는 없습니다';
                      }
                      if (int.parse(value) >
                          defaultPrice - alreadyPrice - discountCoupon) {
                        return '최종가격보다 더 많이 사용할수는 없습니다';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {input = value;});
                      },
                  ),
                  FlatButton(
                    child: new Text("적용"),
                    onPressed: _submit,
                  )
                ],
              ))
        ],
      ));
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
        defaultPrice = secondpurchaseRepairmentRecord.price;
        alreadyPrice = secondpurchaseRepairmentRecord.paidprice;
        finalPrice = defaultPrice - alreadyPrice - discountAll;
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
                                                  onTap: () async {Navigator.pop(context);},
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
                                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                          child: Text(
                                            '현장 진단 후 발생한 견적서가 도착했습니다',
                                            style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.95,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                secondpurchaseRepairmentRecord.manufacture,
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.95,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                secondpurchaseRepairmentRecord.model,
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.95,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '진단 접수 일시 : ',
                                                style: FlutterFlowTheme.bodyText1.override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              secondpurchaseRepairmentRecord.timestamp.toString(),
                                              style: FlutterFlowTheme.bodyText1.override(
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
                                        width: MediaQuery.of(context).size.width * 0.95,
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
                                                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    '증상',
                                                    style: FlutterFlowTheme.bodyText1.override(
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
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                    child: Text(
                                                      secondpurchaseRepairmentRecord.symptom,
                                                      style: FlutterFlowTheme.bodyText1.override(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                          child: Text(
                                            secondpurchaseRepairmentRecord.manufacture,
                                            style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.95,
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                                              child: Text(
                                                'Hello World',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.65,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '예상 수리 기간',
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                child: Text(
                                                  secondpurchaseRepairmentRecord.estDate.toString(),
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.65,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '예상 견적',
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                child: Text(
                                                  secondpurchaseRepairmentRecord.price.toString(),
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                          child: Text(
                                            '결제수단 및 할인 적용',
                                            style: FlutterFlowTheme.bodyText1.override(
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.7,
                                              height: MediaQuery.of(context).size.height * 0.06,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                      child: Text(
                                                        '할인쿠폰',
                                                        style: FlutterFlowTheme.bodyText1.override(
                                                          fontFamily: 'tway_air medium',
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
                                        width: MediaQuery.of(context).size.width * 0.25,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              final result1 = await Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => CouponWidget(coupon: 1,category: secondpurchaseRepairmentRecord.category, idx: secondpurchaseRepairmentRecord.storeidx)),);
                                              result = result1.b;
                                              copNum = result1.a;
                                              final coupon = FirebaseFirestore.instance.collection('coupon').where('coupon_num', isEqualTo: copNum).get();
                                              if(0 <= result && result <= 100){
                                                await setState(() {
                                                  discountCoupon = ((defaultPrice-alreadyPrice) * (result) /100).toInt();
                                                  discountAll = discountCoupon;
                                                  finalPrice = defaultPrice  -alreadyPrice -discountAll;
                                                });
                                              }
                                              else{
                                                await setState(() {
                                                  discountCoupon = result;
                                                  if(discountCoupon > defaultPrice-alreadyPrice){
                                                    discountCoupon = defaultPrice-alreadyPrice;
                                                    discountAll = discountCoupon + discountPoint;
                                                  }
                                                  else discountAll = discountCoupon;
                                                  finalPrice = defaultPrice - alreadyPrice -discountAll;
                                                });
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                  child: Text(
                                                    '$discountCoupon원',
                                                    style: FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'tway_air medium',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                            ),
                                                InkWell(
                                                  onTap: () async {
                                                     final result1 = await Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => CouponWidget(coupon: 1,category: secondpurchaseRepairmentRecord.category, idx: secondpurchaseRepairmentRecord.storeidx)),);
                                                     int result = result1.b;
                                                     //coupon = FirebaseFirestore.instance.collection('coupon').where('coupon_num', isEqualto: result1.a).get();
                                                    if(0 <= result && result <= 100){
                                                      await setState(() {
                                                        discountCoupon = (defaultPrice * result /100).toInt();
                                                        discountAll = discountCoupon;
                                                        finalPrice = defaultPrice -alreadyPrice -discountAll;
                                                      });
                                                    }
                                                    else{
                                                      await setState(() {
                                                        discountCoupon = result;
                                                        if(discountCoupon > defaultPrice) discountAll = defaultPrice;
                                                        else discountAll = discountCoupon;
                                                        finalPrice = defaultPrice - alreadyPrice -discountAll;
                                                      });
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: Colors.black,
                                                    size: 30,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '딱따구리 포인트',
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                          width: MediaQuery.of(context).size.width * 0.25,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                final pointString = await openDialog();
                                                setState(() {
                                                  discountPoint = int.parse(pointString);
                                                  discountAll = discountCoupon + discountPoint;
                                                  finalPrice = defaultPrice - alreadyPrice - discountAll;
                                                });
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                              Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                              child: Text(
                                                    '$discountPoint점',
                                                    style: FlutterFlowTheme.bodyText1.override(
                                                      fontFamily: 'tway_air medium',
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.5,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '현급영수증',
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                          child: FlutterFlowRadioButton(
                                            options: ['미친성', '신청'],
                                            onChanged: (value) {
                                              setState(() => radioButtonValue1 = value);
                                            },
                                            optionHeight: 25,
                                            textStyle: FlutterFlowTheme.bodyText1.override(
                                              fontFamily: 'Playfair Display',
                                              color: Colors.black,
                                            ),
                                            selectedTextStyle: FlutterFlowTheme.bodyText1.override(
                                              fontFamily: 'tway_air medium',
                                              color: Color(0xFF21B6FF),
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                            buttonPosition: RadioButtonPosition.left,
                                            direction: Axis.horizontal,
                                            radioButtonColor: Color(0xFF21B6FF),
                                            inactiveRadioButtonColor: Color(0x8A000000),
                                            toggleable: false,
                                            horizontalAlignment: WrapAlignment.start,
                                            verticalAlignment: WrapCrossAlignment.start,
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
                                          width: MediaQuery.of(context).size.width * 0.9,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Color(0x4B21B6FF),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  'Hello World',
                                                  style: FlutterFlowTheme.bodyText1.override(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                          child: Text(
                                            '결제금액',
                                            style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.65,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text('견적 금액',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                              child: Text(
                                                '$defaultPrice원',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.65,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text('진단 예약 금액',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text('-',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                              child: Text('$alreadyPrice원',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.65,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text(
                                                '할인 금액',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                              child: Text(
                                                discountAll.toString()+'원',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.65,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                              child: Text('추가 결제금액',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        height: MediaQuery.of(context).size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                              child: Text('$finalPrice',
                                                style: FlutterFlowTheme.bodyText1.override(
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
                      StreamBuilder<CouponRecord>(
                        stream: CouponRecord.getDocument(widget.repairmentrf),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: LinearProgressIndicator(
                                color: Color(0xFF2163CB),
                              ),
                            );
                          }
                          final containerRepairmentRecord = snapshot.data;
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Color(0xFF21B6FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: StreamBuilder<List<CouponRecord>>(
                              stream: queryCouponRecord(queryBuilder: (couponRecord) => couponRecord.where('coupon_num', isEqualTo: copNum),
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
                                final rowRepairmentRecord = snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    if(finalPrice > 0) await goBootpayRequest(context, finalPrice);
                                    await containerRepairmentRecord.reference.update(
                                        createCouponRecordData(used : true));
                                    await currentUserReference.update(createUsersRecordData(point : pointHave - discountPoint));
                                    String jumon = secondpurchaseRepairmentRecord.repairmentid;
                                    final createPoint = {...createPointsRecordData(
                                        amount : -discountPoint,
                                        earnedDate: getCurrentTimestamp,
                                        expireDate: getCurrentTimestamp.add(Duration(days: 30)),
                                        reason : '주문시 사용'
                                    )};
                                    final pointref = await PointsRecord.collection.doc();
                                    await pointref.set(createPoint);
                                    final usersUpdateData = {'point_his': FieldValue.arrayUnion([pointref]),};
                                    await currentUserReference.update(usersUpdateData);
                                    final createRepairment = {...createRepairmentRecordData(status: 4,)};
                                    await secondpurchaseRepairmentRecord.reference.update(createRepairment);
                                    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OrderCompleteWidget(),),(route) => false);
                                    },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('결제하기',
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
                                );
                              },
                            ),
                          );
                        },
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
    payload.name = '최종 견적서 2차 결제';
    payload.price = amount.toDouble();
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString()+ currentUserUid;


    User user = User();
    user.username = currentUserDisplayName;
    user.email = currentUserEmail;

    Extra extra = Extra();
    extra.appScheme = 'bootpaySample';

    Item item1 = Item();
    item1.itemName = "최종 견적 수리비"; // 주문정보에 담길 상품명
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

