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

class StoreListNewWidget extends StatefulWidget {
  const StoreListNewWidget({
    Key key,
    this.category,
  }) : super(key: key);

  final String category;

  @override
  _StoreListNewWidgetState createState() => _StoreListNewWidgetState();
}

class _StoreListNewWidgetState extends State<StoreListNewWidget> {
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
        List<RepairmentRecord> storeListNewRepairmentRecordList = snapshot.data;
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
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
              child: Text(
                '수리 내역',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Color(0x68C3C8CA),
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
                    child: Builder(
                      builder: (context) {
                        final listofstore =
                            storeListNewRepairmentRecordList?.toList() ?? [];
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(listofstore.length,
                                    (listofstoreIndex) {
                                  final listofstoreItem =
                                  listofstore[listofstoreIndex];
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
                                                      stidx: listofstoreItem.storeidx,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 16, 16, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listofstoreItem.model,
                                                        style: FlutterFlowTheme
                                                            .title1
                                                            .override(
                                                          fontFamily: 'Lexend Deca',
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right_rounded,
                                                      color: Colors.white,
                                                      size: 24,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 4, 16, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        listofstoreItem.brokenPart,
                                                        style: FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily: 'Lexend Deca',
                                                          color: Color(0xFF39D2C0),
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 4, 16, 16),
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
                                                                    listofstoreItem
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
                                                          color: Color(0xFF5D8ADB),
                                                          textStyle:
                                                          GoogleFonts.getFont(
                                                            'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                          elevation: 3,
                                                          borderSide: BorderSide(
                                                            color:
                                                            Colors.transparent,
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
                                                          MainAxisAlignment.end,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                          children: [],
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
      },
    );
  }
}
