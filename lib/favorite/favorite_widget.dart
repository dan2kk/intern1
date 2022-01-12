import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../repairment_store_detail/repairment_store_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                          '즐겨찾기',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'tway_air medium',
                            color: Color(0xFF4B39EF),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(180, 0, 0, 0),
                          child: FaIcon(
                            FontAwesomeIcons.solidBell,
                            color: Color(0xFF4B39EF),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AuthUserStreamWidget(
              child: Builder(
                builder: (context) {
                  final lllll =
                      currentUserDocument?.favorites?.toList()?.toList() ?? [];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(lllll.length, (lllllIndex) {
                      final lllllItem = lllll[lllllIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: StreamBuilder<List<RepairstoreRecord>>(
                          stream: queryRepairstoreRecord(
                            queryBuilder: (repairstoreRecord) =>
                                repairstoreRecord.where('idx',
                                    isEqualTo: lllllItem),
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
                            List<RepairstoreRecord> rowRepairstoreRecordList =
                                snapshot.data;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data.isEmpty) {
                              return Container();
                            }
                            final rowRepairstoreRecord =
                                rowRepairstoreRecordList.isNotEmpty
                                    ? rowRepairstoreRecordList.first
                                    : null;
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RepairmentStoreDetailWidget(
                                      stidx: lllllItem,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            rowRepairstoreRecord.imgUrl1,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Text(
                                              '업체명: ',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Color(0xFF4450C5),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 0, 0),
                                            child: Text(
                                              '카테고리: ',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Color(0xFF4450C5),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Text(
                                              '수리 품목:',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Color(0xFF4450C5),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            rowRepairstoreRecord.name,
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Text(
                                            rowRepairstoreRecord.category,
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                          Text(
                                            rowRepairstoreRecord.breif,
                                            style: FlutterFlowTheme.bodyText1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
