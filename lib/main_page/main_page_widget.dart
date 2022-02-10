import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../eventdetail/eventdetail_widget.dart';
import '../fix_history/fix_history_widget.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../storelist/storelist_widget.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  PageController pageViewController;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if ((currentUserUid) == '')
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPageWidget(),),
                                        );
                                      },
                                      child: Text(
                                        '로그인',
                                        style: TextStyle(
                                          fontFamily: 'tway_air medium',
                                          color: Color(0xFF21B6FF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  if ((currentUserUid) != '')
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => NavBarPage(initialPage: 'MyPage'),),
                                        );
                                      },
                                      child: Text(
                                        '마이페이지',
                                        style:
                                        FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'tway_air medium',
                                          color: Color(0xFF21B6FF),
                                          fontSize: 18,
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.31,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FIxHistoryWidget(),),
                                  );
                                },
                                child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/ttak-tta-gu-ri.appspot.com/o/%EC%B9%B4%ED%8A%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.JPG?alt=media&token=762b88d6-10cb-40b3-8887-96b58272d81a',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                    child: FlutterFlowPlacePicker(
                      iOSGoogleMapsApiKey:
                      'AIzaSyDNoM8WgkE9gXuLPh9AcDjMvr2o5fspSpI',
                      androidGoogleMapsApiKey:
                      'AIzaSyD0cTKJv0xqY_p1XU7OEzliJOs2cn5nL-E',
                      webGoogleMapsApiKey:
                      'AIzaSyA-zHCiO1a9q5VM4zmWdOrbXgdLcKiIrSo',
                      onSelect: (place) => setState(() => placePickerValue = place),
                      defaultText: 'Select Location',
                      icon: Icon(
                        Icons.place,
                        color: Color(0xFF21B6FF),
                        size: 20,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 200,
                        height: 40,
                        color: Colors.white,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'tway_air medium',
                          color: Color(0xFF070707),
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF21B6FF),
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              '수리가 필요한 모든 것엔 ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'tway_air medium',
                                color: Color(0xFF21B6FF),
                                fontSize: 15,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -1),
                                    child: Text(
                                      '딱따구리',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'tway_air medium',
                                        color: Color(0xFF21B6FF),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 45,
                                      ),
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  '오늘의 수리',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'tway_air medium',
                                    color: Color(0xFF21B6FF),
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 40),
                      child: Container(
                        width: 380,
                        height: 100,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          maxHeight: MediaQuery.of(context).size.height * 1,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0x68C3C8CA),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: StreamBuilder<List<EventsRecord>>(
                            stream: queryEventsRecord(
                              queryBuilder: (eventsRecord) => eventsRecord.where('ongoing', isEqualTo: true),
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
                              List<EventsRecord> pageViewEventsRecordList =
                                  snapshot.data;
                              if (pageViewEventsRecordList.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/fq0h2__.JPG',
                                  ),
                                );
                              }
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                child: PageView.builder(
                                  controller: pageViewController ??= PageController(
                                          initialPage: min(0, pageViewEventsRecordList.length - 1)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: pageViewEventsRecordList.length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewEventsRecord = pageViewEventsRecordList[pageViewIndex];
                                    return Stack(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => EventdetailWidget(events: pageViewEventsRecord.reference,),
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Image.network(
                                              pageViewEventsRecord.banner,
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height * 1,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(260, 80, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0x9614181B),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  '${(pageViewIndex+1).toString()} / ${(pageViewEventsRecordList.length).toString()} 모두보기', '0 / 0 모두보기',
                                                ),
                                                style: FlutterFlowTheme.bodyText1.override(
                                                  fontFamily: 'tway_air medium',
                                                  color: FlutterFlowTheme.secondaryColor,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            '수리 카테고리',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'tway_air medium',
                              color: Color(0xFF21B6FF),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.05),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 100),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0x68C3C8CA),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, -0.2),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.48,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => StorelistWidget(category: 'electronics',),),);
                                              },
                                              child: Image.asset(
                                                'assets/images/r85he_.png',
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.48,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => StorelistWidget(category: 'mobile_phone',),
                                                  ),
                                                );
                                              },
                                              child: Image.asset(
                                                'assets/images/0267p_.png',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.24,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => StorelistWidget(category: 'electronics',),),
                                                  );
                                                },
                                                child: Image.asset(
                                                  'assets/images/o5cwj_.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.24,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: Image.asset(
                                                'assets/images/u84op_.png',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.24,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => StorelistWidget(category: 'luxury',),
                                                    ),
                                                  );
                                                },
                                                child: Image.asset(
                                                  'assets/images/8kom9_.png',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.24,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => StorelistWidget(category: 'transportation',),
                                                    ),
                                                  );
                                                },
                                                child: Image.asset(
                                                  'assets/images/7f60i_.png',
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
                                  ],
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
            ),
          ],
        ),
      ),
    );
  }
}
