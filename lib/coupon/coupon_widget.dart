import 'package:intern1/login_page/login_page_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_rive_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({
    Key key,
    this.coupon,
  }) : super(key: key);

  final int coupon;

  @override
  _CouponWidgetState createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  String radioButtonValue;
  List<bool> radioButtonAccess = [];
  int selected = 0;
  List<double> border = [];
  List<int> chooseColor = [];
  List<Color> color = [Color(0xFF000000),Color(0xFF21B6FF)];
  final riveAnimationAnimationsList = [
    'Animation 1',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
  TextEditingController textController;
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

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CouponRecord>>(
      stream: queryCouponRecord(
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
        List<CouponRecord> couponCouponRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final couponCouponRecord = couponCouponRecordList.isNotEmpty
            ? couponCouponRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, -0.5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
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
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/16.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                                shape: BoxShape.rectangle
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            MediaQuery.of(context).size.width*0.25, 0, 0, 0),
                                        child: Text(
                                          '쿠폰 현황',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 108,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFEEEEEE),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 4, 0),
                                      child: Container(
                                    width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/17.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.rectangle
                                ),
                              ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: TextFormField(
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                                'textController',
                                                Duration(milliseconds: 1000),
                                                    () => setState(() {}),
                                              ),
                                          controller: textController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: '쿠폰번호 입력하기',
                                            labelStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
                                              color: Color(0xFF95A1AC),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Color(0xFF95A1AC),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(0.95, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            if ((couponCouponRecord.uid) !=
                                                '') {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('이미 등록된 쿠폰'),
                                                    content:
                                                    Text('이미 등록된 쿠폰입니다!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                            if ((couponCouponRecord.uid) == '') {
                                              final couponUpdateData = createCouponRecordData(uid: currentUserUid,);
                                              await couponCouponRecord.reference.update(couponUpdateData);}
                                            else {
                                              return;
                                            }
                                            final usersUpdateData = {
                                              'coupon_his':
                                              FieldValue.arrayUnion([
                                                couponCouponRecord.reference
                                              ]),
                                            };
                                            await currentUserReference
                                                .update(usersUpdateData);
                                          },
                                          child: Icon(
                                            Icons.transit_enterexit_outlined,
                                            color: Color(0xFF95A1AC),
                                            size: 24,
                                          ),
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
                    AuthUserStreamWidget(
                      child: Builder(
                        builder: (context) {
                          final listofcoupon = currentUserDocument?.couponHis?.toList() ?? [];
                          int select = 0;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(listofcoupon.length,
                                      (listofcouponIndex) {
                                    final listofcouponItem = listofcoupon[listofcouponIndex];
                                    chooseColor.add(0);
                                    border.add(1);
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: StreamBuilder<CouponRecord>(
                                        stream: CouponRecord.getDocument(
                                            listofcouponItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: LinearProgressIndicator(
                                                color: Color(0xFF2163CB),
                                              ),
                                            );
                                          }
                                          final storeListViewCouponRecord =
                                              snapshot.data;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width * 0.95,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: border[listofcouponIndex],
                                                    color: color[chooseColor[listofcouponIndex]],
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 80,
                                                          child:
                                                          RiveAnimation.asset(
                                                            'assets/rive_animations/1435-2808-scrolling-letter.riv',
                                                            artboard:
                                                            'New Artboard',
                                                            fit: BoxFit.cover,
                                                            controllers:
                                                            riveAnimationControllers,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            8, 1, 0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                              MainAxisSize.max,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    Text(
                                                                      storeListViewCouponRecord
                                                                          .breif,
                                                                      style: FlutterFlowTheme
                                                                          .subtitle1
                                                                          .override(
                                                                        fontFamily:
                                                                        'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF15212B),
                                                                        fontSize:
                                                                        18,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                              MainAxisSize.max,
                                                              children: [
                                                                Text(
                                                                  '${dateTimeFormat('y년 M월 d', storeListViewCouponRecord.expireDate)}일 까지 사용가능',
                                                                  style:
                                                                  FlutterFlowTheme.bodyText2.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF8B97A2),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Text(
                                                                  storeListViewCouponRecord.couponNum,
                                                                  style: FlutterFlowTheme.bodyText1.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF4B39EF),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              onTap: () async {
                                                if(widget.coupon == 1){
                                                  setState(() {
                                                    for(int i=0; i<listofcoupon.length;i++){
                                                      border[i] = 1;
                                                      chooseColor[i] = 0;
                                                    }
                                                    border[listofcouponIndex] = 5;
                                                    chooseColor[listofcouponIndex] = 1;
                                                    selected = listofcouponIndex;
                                                  });
                                                  print(selected);
                                                }
                                              }
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                      ),
                    ),
                    if(widget.coupon == 1)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () {

                            },
                            text: '쿠폰 적용하기',
                            options: FFButtonOptions(
                              width: 180,
                              height: 60,
                              color: Color(0xFF21B6FF),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'tway_air medium',
                                color: Colors.white,
                                fontSize: 20,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
