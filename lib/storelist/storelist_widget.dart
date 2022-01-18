import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../repairment_store_detail/repairment_store_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class StorelistWidget extends StatefulWidget {
  const StorelistWidget({
    Key key,
    this.category,
  }) : super(key: key);

  final String category;

  @override
  _StorelistWidgetState createState() => _StorelistWidgetState();
}

class _StorelistWidgetState extends State<StorelistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RepairstoreRecord>>(
      stream: queryRepairstoreRecord(
        queryBuilder: (repairstoreRecord) =>
            repairstoreRecord.where('category', isEqualTo: widget.category),
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
        List<RepairstoreRecord> storelistRepairstoreRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF21B6FF),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
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
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, -0.5),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                              width: 55,
                                              height: 55,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    110, 0, 0, 0),
                                            child: Text(
                                              '수리 업체',
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0.1),
                              child: FutureBuilder<List<RepairstoreRecord>>(
                                future: queryRepairstoreRecordOnce(
                                  queryBuilder: (repairstoreRecord) =>
                                      repairstoreRecord
                                          .where('category',
                                              isEqualTo: widget.category)
                                          .orderBy('rate', descending: true),
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
                                  List<RepairstoreRecord>
                                      listViewRepairstoreRecordList =
                                      snapshot.data;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewRepairstoreRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewRepairstoreRecord =
                                          listViewRepairstoreRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType
                                                    .leftToRight,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child:
                                                    RepairmentStoreDetailWidget(
                                                  stidx:
                                                      listViewRepairstoreRecord
                                                          .idx,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .leftToRight,
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      reverseDuration: Duration(
                                                          milliseconds: 300),
                                                      child:
                                                          RepairmentStoreDetailWidget(
                                                        stidx:
                                                            listViewRepairstoreRecord
                                                                .idx,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.network(
                                                      valueOrDefault(listViewRepairstoreRecord
                                                          .imgUrl1, "https://firebasestorage.googleapis.com/v0/b/ttak-tta-gu-ri.appspot.com/o/assets%2Fbqllo__.png?alt=media&token=f8a92a93-3ed5-4a18-a86d-e12e988aa58c"),
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                listViewRepairstoreRecord
                                                                    .name,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                listViewRepairstoreRecord
                                                                    .breif,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  1, 0, 0, 0),
                                                      child: RatingBarIndicator(
                                                        itemBuilder:
                                                            (context, index) =>
                                                                ImageIcon(
                                                          AssetImage('assets/images/13.png'),
                                                          color:
                                                              Color(0xFF21B6FF),
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        rating:
                                                            listViewRepairstoreRecord
                                                                .rate,
                                                        unratedColor:
                                                            Color(0xFF9E9E9E),
                                                        itemCount: 5,
                                                        itemSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
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
        );
      },
    );
  }
}
