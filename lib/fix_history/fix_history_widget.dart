import '../add_review/add_review_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../repairment_detail/repairment_detail_widget.dart';
import '../review_detail/review_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FixHistoryWidget extends StatefulWidget {
  const FixHistoryWidget({Key key}) : super(key: key);

  @override
  _FixHistoryWidgetState createState() => _FixHistoryWidgetState();
}

class _FixHistoryWidgetState extends State<FixHistoryWidget> {
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
        List<RepairmentRecord> fixHistoryRepairmentRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.secondaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.91, -0.95),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.02, -1),
                  child: Text(
                    '수리 내역',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'tway_air medium',
                      color: Color(0xFF3F51B5),
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.95, -0.96),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
                      );
                    },
                    child: Text(
                      '로그아웃',
                      style: TextStyle(
                        fontFamily: 'tway_air medium',
                        color: Color(0xFF5C6EBE),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Builder(
                        builder: (context) {
                          final aaaaa =
                              fixHistoryRepairmentRecordList?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: aaaaa.length,
                            itemBuilder: (context, aaaaaIndex) {
                              final aaaaaItem = aaaaa[aaaaaIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 20),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          aaaaaItem.imgUrl,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 0, 0),
                                              child: Text(
                                                '수리 상점',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF4B39EF),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 0, 0),
                                              child: Text(
                                                '수리 모델',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF4B39EF),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 0, 0),
                                              child: Text(
                                                '요청 날짜',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF4B39EF),
                                                  fontSize: 15,
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
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 0, 0),
                                              child: Text(
                                                aaaaaItem.manufacture,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF4B39EF),
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 0, 0),
                                              child: Text(
                                                aaaaaItem.model,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF4B39EF),
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 20, 0, 0),
                                              child: Text(
                                                aaaaaItem.timestamp.toString(),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF4B39EF),
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
                                                0.2,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              RepairmentDetailWidget(
                                                            repairmentid:
                                                                aaaaaItem
                                                                    .repairmentid,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.settings_outlined,
                                                      color: Colors.black,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                if ((aaaaaItem.status) == 6)
                                                  Container(
                                                    width: 100,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                    ),
                                                    child: Visibility(
                                                      visible:
                                                          (aaaaaItem.status) ==
                                                              6,
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddReviewWidget(
                                                                repairmentid:
                                                                    aaaaaItem
                                                                        .repairmentid,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        text: '리뷰 작성',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((aaaaaItem.status) == 7)
                                                  Container(
                                                    width: 100,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                    ),
                                                    child: Visibility(
                                                      visible:
                                                          (aaaaaItem.status) ==
                                                              7,
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ReviewDetailWidget(
                                                                re000: aaaaaItem
                                                                    .repairmentid,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        text: '리뷰 보기',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130,
                                                          height: 40,
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius: 12,
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
                              );
                            },
                          );
                        },
                      ),
                    ),
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
