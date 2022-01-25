import '../add_review/add_review_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../repairment_detail/repairment_detail_widget.dart';
import '../repairment_store_detail/repairment_store_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FIxHistoryWidget extends StatefulWidget {
  const FIxHistoryWidget({Key key}) : super(key: key);

  @override
  _FIxHistoryWidgetState createState() => _FIxHistoryWidgetState();
}

class _FIxHistoryWidgetState extends State<FIxHistoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RepairmentRecord>>(
      stream: queryRepairmentRecord(
        queryBuilder: (repairmentRecord) =>
            repairmentRecord.where('userid', isEqualTo: currentUserUid),
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
        List<RepairmentRecord> fIxHistoryRepairmentRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFF5F5F5),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left,
                color: Color(0xFF21B6FF),
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              '수리 내역',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF21B6FF),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [],
            centerTitle: true,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final listofhistory = fIxHistoryRepairmentRecordList?.toList() ?? [];
                      listofhistory.sort((b, a) =>(a.timestamp.compareTo(b.timestamp)));
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listofhistory.length,
                        itemBuilder: (context, listofhistoryIndex) {
                          final listofhistoryItem =
                          listofhistory[listofhistoryIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.95,
                                  height:
                                  MediaQuery.of(context).size.height * 0.3,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0xFFF5F5F5),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              2, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: Text(
                                                  listofhistoryItem.manufacture,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'tway_air medium',
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.5,
                                        indent: 15,
                                        endIndent: 15,
                                        color: Color(0xFF21B6FF),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 0, 0, 0),
                                            child: Text(
                                              listofhistoryItem.model,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 50, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.22,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.05,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0.1,
                                                    color: Colors.black,
                                                    offset: Offset(0.1, 0.1),
                                                    spreadRadius: 0.1,
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF21B6FF),
                                                  width: 1,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddReviewWidget(
                                                            repairmentid:
                                                            listofhistoryItem
                                                                .repairmentid,
                                                          ),
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
                                                      '리뷰 쓰기',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                                  0.22,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.05,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0.1,
                                                    color: Colors.black,
                                                    offset: Offset(0.1, 0.1),
                                                    spreadRadius: 0.1,
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF21B6FF),
                                                  width: 1,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RepairmentDetailWidget(
                                                            repairmentid:
                                                            listofhistoryItem
                                                                .repairmentid,
                                                          ),
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
                                                      '주문 상세',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                                  0.22,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.05,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0.1,
                                                    color: Colors.black,
                                                    offset: Offset(0.1, 0.1),
                                                    spreadRadius: 0.1,
                                                  )
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF21B6FF),
                                                  width: 1,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RepairmentStoreDetailWidget(
                                                            stidx: listofhistoryItem
                                                                .storeidx,
                                                          ),
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
                                                      '가게 보기',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w500,
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
                              ),
                            ],
                          );
                        },
                      );
                    },
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
