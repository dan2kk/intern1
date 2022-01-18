import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../repairment_detail/repairment_detail_widget.dart';
import '../repairment_store_detail/repairment_store_detail_widget.dart';
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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF21B6FF),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.secondaryColor,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          '수리 내역',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFD3DDE1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFF21B6FF),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: StreamBuilder<List<RepairmentRecord>>(
                  stream: queryRepairmentRecord(
                    queryBuilder: (repairmentRecord) => repairmentRecord
                        .where('userid', isEqualTo: currentUserUid),
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
                    List<RepairmentRecord> columnScrollRepairmentRecordList =
                        snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnScrollRepairmentRecordList.length,
                                (columnScrollIndex) {
                              final columnScrollRepairmentRecord =
                              columnScrollRepairmentRecordList[
                              columnScrollIndex];
                              return Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 184,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33181818),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x65090F13),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RepairmentStoreDetailWidget(
                                                  stidx: columnScrollRepairmentRecord
                                                      .storeidx,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                16, 16, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    columnScrollRepairmentRecord
                                                        .model,
                                                    style: FlutterFlowTheme.title1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            RepairmentDetailWidget(
                                                              repairmentid:
                                                              columnScrollRepairmentRecord
                                                                  .repairmentid,
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                16, 4, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    columnScrollRepairmentRecord
                                                        .manufacture,
                                                    style: FlutterFlowTheme
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF39D2C0),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 16),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              RepairmentDetailWidget(
                                                                repairmentid:
                                                                columnScrollRepairmentRecord
                                                                    .repairmentid,
                                                              ),
                                                        ),
                                                      );
                                                    },
                                                    text: '견적보기',
                                                    icon: Icon(
                                                      Icons.add_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 120,
                                                      height: 40,
                                                      color: Color(0xFF21B6FF),
                                                      textStyle:
                                                      GoogleFonts.getFont(
                                                        'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                      elevation: 3,
                                                      borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 8,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              columnScrollRepairmentRecord
                                                                  .symptom,
                                                              style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                                fontFamily:
                                                                'tway_air medium',
                                                                color: Colors.white,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                useGoogleFonts:
                                                                false,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
