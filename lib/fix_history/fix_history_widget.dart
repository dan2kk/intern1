import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../repairment_detail/repairment_detail_widget.dart';
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
          backgroundColor: Color(0x9F21B6FF),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final listofhistory =
                          fIxHistoryRepairmentRecordList?.toList() ?? [];
                      listofhistory.sort((b, a) => a.timestamp.compareTo(b.timestamp));
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listofhistory.length,
                        itemBuilder: (context, listofhistoryIndex) {
                          final listofhistoryItem = listofhistory[listofhistoryIndex];
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
                                  MediaQuery.of(context).size.height * 0.27,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0xFFF5F5F5),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    listofhistoryItem
                                                        .manufacture,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'tway_air medium',
                                                      fontSize: 20,
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
                                                0.1,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                              BorderRadius.circular(20),
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
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: Color(0xFF21B6FF),
                                                    size: 24,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.13,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: Image.network(
                                                listofhistoryItem.imgUrl,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                7, 0, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.6,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(10,10, 0, 0),
                                                    child : Text(
                                                    listofhistoryItem.symptom,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'tway_air medium',
                                                      fontSize: 15,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                28, 0, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
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
                                              text: '+견적보기',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Color(0xFF3F51B5),
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Colors.white,
                                                  fontSize: 18,
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
                                          ),
                                        ],
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
