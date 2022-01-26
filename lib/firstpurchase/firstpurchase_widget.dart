import 'package:intern1/coupon/coupon_widget.dart';
import 'package:intern1/pointview/pointview_widget.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_complete/order_complete_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpostal/kpostal.dart';
import '../auth/auth_util.dart';
import 'package:time_picker_widget/time_picker_widget.dart';
import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:bootpay_api/model/item.dart';

class FirstpurchaseWidget extends StatefulWidget {
  const FirstpurchaseWidget({Key key, this.repairmentrf})
      : super(key: key);

  final DocumentReference repairmentrf;

  @override
  _FirstpurchaseWidgetState createState() => _FirstpurchaseWidgetState();
}

class _FirstpurchaseWidgetState extends State<FirstpurchaseWidget> {
  TextEditingController controller;
  DateTime datePicked;
  TimeOfDay timePicked;
  String radioButtonValue2;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  String radioButtonValue1 = '픽업, 배송 수리(배달비 별도)';
  String radioButtonValue3;
  TextEditingController textController4;
  TextEditingController textController5;
  String radioButtonValue4;
  String radioButtonValue5;
  String radioButtonValue6;
  String dropDownValue1;
  String dropDownValue2;
  String postCode = '-';
  String address = '';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';
  List<int> _availableMinutes = [0, 30];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int defaultPrice = 30000;
  int shipmentPrice = 6000;
  int discountAll = 0;
  int finalPrice = 36000;
  int discountCoupon = 0;
  int discountPoint = 0;
  int pointHave = currentUserDocument.point ?? 0;
  String input = '';
  int result = 0;
  String copNum = '';
  List<double> sizeofContainer = [0.45, 0.35];
  int numofCon = 0;
  bool _submitted = false;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    // set this variable to true when we try to submit
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      discountPoint = int.parse(input);
      discountAll = discountCoupon + discountPoint;
      finalPrice = defaultPrice + shipmentPrice - discountAll;
      setState(() => _submitted = true);
      Navigator.pop(context);
      print('1');
    }
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    controller = TextEditingController();
  }
  @override
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
                              defaultPrice + shipmentPrice - discountCoupon) {
                            return '최종가격보다 더 많이 사용할수는 없습니다';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() => {
                              input = value,
                            }),
                      ),
                      FlatButton(
                        child: new Text("적용"),
                        onPressed: input.isEmpty ? _submit : null,
                      )
                    ],
                  ))
            ],
          ));

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
                                    child: // Generated code for this Column Widget...
                                    Column(
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
                                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                        '수리신청 및 결제',
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
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                child: Text(
                                                  '수리 서비스 선택',
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
                                          height: 30,
                                          thickness: 1,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FlutterFlowRadioButton(
                                              options: ['픽업, 배송 수리(배달비 별도)', '방문수리(예약)'],
                                              onChanged: (value) {
                                                setState(() {
                                                  if(value == '픽업, 배송 수리(배달비 별도)'){
                                                    numofCon = 0;
                                                    radioButtonValue1 = value;
                                                }
                                                  else{
                                                    numofCon = 1;
                                                    radioButtonValue1 = value;
                                                  }
                                                });
                                              },
                                              optionHeight: 25,
                                              textStyle: FlutterFlowTheme.bodyText1.override(
                                                fontFamily: 'tway_air medium',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                              selectedTextStyle: FlutterFlowTheme.bodyText1.override(
                                                fontFamily: 'tway_air medium',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
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
                                              15, 10, 0, 0),
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (_) =>
                                                                  KpostalView(
                                                                useLocalServer:
                                                                    false,
                                                                // default is false
                                                                localPort: 8080,
                                                                // default is 8080
                                                                kakaoKey:
                                                                    '10d8be79d5abf697db85adacc1079279',
                                                                // if not declared, only use platform's geocoding
                                                                callback:
                                                                    (Kpostal
                                                                        result) {
                                                                  setState(() {
                                                                    this.postCode =
                                                                        result
                                                                            .postCode;
                                                                    this.address =
                                                                        result
                                                                            .address;
                                                                    this.latitude = result
                                                                        .latitude
                                                                        .toString();
                                                                    this.longitude = result
                                                                        .longitude
                                                                        .toString();
                                                                    this.kakaoLatitude = result
                                                                        .kakaoLatitude
                                                                        .toString();
                                                                    this.kakaoLongitude = result
                                                                        .kakaoLongitude
                                                                        .toString();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                          height: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color(0xf5f5f5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Text(
                                                            valueOrDefault(
                                                                address,
                                                                '주소 찾기'),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .title3
                                                                    .override(
                                                              fontFamily:
                                                                  'tway_air medium',
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                          ),
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
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
                                                    controller: textController2,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: '상세 주소 입력',
                                                      hintStyle:
                                                      FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        fontSize: 13,
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
                                                    .fromSTEB(15, 10, 0, 0),
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
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                                        child: TextFormField(
                                                          controller: textController3,
                                                          obscureText: false,
                                                          decoration: InputDecoration(
                                                            hintText: '전화번호 입력',
                                                            hintStyle: FlutterFlowTheme.bodyText1.override(
                                                              fontFamily: 'tway_air medium',
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w500,
                                                              useGoogleFonts: false,
                                                            ),
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius: const BorderRadius.only(
                                                                topLeft: Radius.circular(4.0),
                                                                topRight: Radius.circular(4.0),
                                                              ),
                                                            ),
                                                            focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Color(0x00000000),
                                                                width: 1,
                                                              ),
                                                              borderRadius: const BorderRadius.only(
                                                                topLeft: Radius.circular(4.0),
                                                                topRight: Radius.circular(4.0),
                                                              ),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme.bodyText1.override(
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
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 5, 0, 0),
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
                                                  fontSize: 13,
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
                                        if (radioButtonValue1 ==
                                            '픽업, 배송 수리(배달비 별도)')
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (radioButtonValue1 ==
                                            '픽업, 배송 수리(배달비 별도)')
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
                                                        .showDatePicker(
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
                                                      maxTime:
                                                          getCurrentTimestamp
                                                              .add(
                                                                  const Duration(
                                                                      days:
                                                                          30)),
                                                      locale: LocaleType.ko,
                                                    );
                                                    await showCustomTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay(
                                                                hour: 6,
                                                                minute:
                                                                    _availableMinutes
                                                                        .first),
                                                            onFailValidation:
                                                                (context) =>
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              new Text("알림!"),
                                                                          content:
                                                                              new Text("30분 단위로 시간을 골라주세요!"),
                                                                          actions: <
                                                                              Widget>[
                                                                            new FlatButton(
                                                                              child: new Text("알겠습니다."),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                            selectableTimePredicate: (time) =>
                                                                _availableMinutes.indexOf(
                                                                    time.minute) !=
                                                                -1)
                                                        .then((time) => setState(
                                                            () => datePicked =
                                                                datePicked.add(Duration(
                                                                    hours: time.hour,
                                                                    minutes: time.minute))));
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.90,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x4b21b6ff),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
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
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'y년 M월 dd일 a h:mm',
                                                                  datePicked),
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                fontFamily:
                                                                    'tway_air medium',
                                                                color: Colors
                                                                    .black,
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
                                        0.45,
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
                                              0, 10, 0, 0),
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
                                                  child: DropdownButton<String>(
                                                    value: dropDownValue1,
                                                    icon: const Icon(Icons.arrow_downward),
                                                    elevation: 24,
                                                    style: const TextStyle(color: Colors.black87),
                                                    underline: Container(
                                                      width: MediaQuery.of(context).size.width * 0.9,
                                                      height: 2,
                                                      color: Color(0xFF21B6FF),
                                                    ),
                                                    onChanged: (String newValue) {
                                                      setState(() {
                                                        dropDownValue1 = newValue;});
                                                    },
                                                    items: <String>['잘 수리해주길 부탁드립니다! :)', '딱따구리만의 서비스가 혹시 있을까요?', '예민한 친구입니다. 소중하게 다뤄주세요', '수리하기 전에 전화 부탁드립니다!',
                                                      '요청사항 없음', '직접 입력                                                      ']
                                                        .map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(valueOrDefault(value, '선택해 주세요'),
                                                          style: FlutterFlowTheme.bodyText1
                                                              .override(
                                                            fontFamily: 'tway_air medium',
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w500,
                                                            useGoogleFonts: false,
                                                          ),),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                        ),
                                              ], ),
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 5, 0, 0),
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
                                                    .fromSTEB(15, 10, 0, 0),
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
                                              0, 15, 0, 0),
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
                                                  child: DropdownButton<String>(
                                                    value: dropDownValue2,
                                                    icon: const Icon(
                                                        Icons.arrow_downward),
                                                    elevation: 24,
                                                    style: const TextStyle(
                                                        color: Colors.black87),
                                                    underline: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.9,
                                                      height: 2,
                                                      color: Color(0xFF21B6FF),
                                                    ),
                                                    onChanged:
                                                        (String newValue) {
                                                      setState(() {
                                                        dropDownValue2 =
                                                            newValue;
                                                      });
                                                    },
                                                    items: <String>[
                                                      '조심히 안전하게 와주세요 :)',
                                                      '문앞에 두고 벨 눌러주세요',
                                                      '벨 누르지 말고 노크해주세요',
                                                      '도착하기 전에 전화해주세요',
                                                      '요청사항 없음',
                                                      '직접 입력                                                      '
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          valueOrDefault(
                                                              value, '선택해 주세요'),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'tway_air medium',
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
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
                                                  .fromSTEB(15, 5, 0, 0),
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
                                                  0.5,
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
                                                  0.45,
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
                                                    final result1 = await Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) => CouponWidget(coupon: 1,category: firstpurchaseRepairmentRecord.category, idx: firstpurchaseRepairmentRecord.storeidx)),);
                                                    result = result1.b;
                                                    copNum = result1.a;
                                                    final coupon = FirebaseFirestore.instance.collection('coupon').where('coupon_num', isEqualTo: copNum).get();
                                                    if(0 <= result && result <= 100){
                                                      await setState(() {
                                                        discountCoupon = (defaultPrice * (result) /100).toInt();
                                                        discountAll = discountCoupon;
                                                        finalPrice = defaultPrice  + shipmentPrice -discountAll;
                                                      });
                                                    }
                                                    else{
                                                      await setState(() {
                                                        discountCoupon = result;
                                                        if(discountCoupon > defaultPrice){
                                                          discountCoupon = defaultPrice;
                                                          discountAll = defaultPrice;
                                                        }
                                                        else discountAll = discountCoupon;
                                                        finalPrice = defaultPrice + shipmentPrice -discountAll;
                                                      });
                                                    }
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '할인금액: $discountCoupon원',
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
                                                      final pointString = await openDialog();
                                                      setState(() {
                                                        discountPoint = int.parse(pointString);
                                                        discountAll = discountCoupon + discountPoint;
                                                        finalPrice = defaultPrice + shipmentPrice - discountAll;
                                                      });
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          '할인금액 : $discountPoint 원',
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
                                                        '현금영수증',
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
                                                    .fromSTEB(0, 0, 0, 0),
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
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      defaultPrice.toString() +'원',
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
                                                        shipmentPrice.toString()+'원',
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
                                                        '할인 금액',
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
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      discountAll.toString()+' 원',
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
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      finalPrice.toString()+' 원',
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
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(
                            0, 10, 0, 0),
                        child:Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                        ),
                        child: Align(
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
                                    child: StreamBuilder<List<CouponRecord>>(
                                           stream: queryCouponRecord(queryBuilder: (couponRecord) => couponRecord.where('coupon_num', isEqualTo: copNum),
                                          singleRecord: true,),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color: Color(0xFF2163CB),
                                            ),
                                          );
                                        }
                                        List<CouponRecord> rowCouponList = snapshot.data;
                                        final rowCouponRecord = rowCouponList.isNotEmpty ? rowCouponList.first : null;
                                        return InkWell(
                                          onTap: () async {
                                            if(finalPrice > 0) await goBootpayRequest(context, finalPrice);
                                            await rowCouponRecord.reference.update(
                                            createCouponRecordData(
                                                used : true
                                              ));
                                            await currentUserReference.update(createUsersRecordData(point : pointHave - discountPoint));
                                            String jumon =firstpurchaseRepairmentRecord.repairmentid;
                                            final createPoint = {...createPointsRecordData(
                                              amount : -discountPoint,
                                              earnedDate: getCurrentTimestamp,
                                              expireDate: getCurrentTimestamp.add(Duration(days: 30)),
                                              reason : '주문번호 $jumon에 사용'
                                            )};
                                            final pointref = await PointsRecord.collection.doc();
                                            await pointref.set(createPoint);
                                            final usersUpdateData = {'point_his': FieldValue.arrayUnion([pointref]),};
                                            await currentUserReference.update(usersUpdateData);
                                            final createRepairment = {...createRepairmentRecordData(
                                              status: 3,
                                            )};
                                            await firstpurchaseRepairmentRecord.reference.update(createRepairment);
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => OrderCompleteWidget(),
                                              ),(route) => false);
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
                                        );
                                      },
                                    ),
                                  )
                            ],
                          ),
                        ),
                      ),
                      )],
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
