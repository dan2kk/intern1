import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../review_detail/review_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewListWidget extends StatefulWidget {
  const ReviewListWidget({
    Key key,
    this.storeidx,
  }) : super(key: key);

  final int storeidx;

  @override
  _ReviewListWidgetState createState() => _ReviewListWidgetState();
}

class _ReviewListWidgetState extends State<ReviewListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.secondaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '리뷰',
          style: TextStyle(
            fontFamily: 'tway_air medium',
            color: Color(0xFF1E1111),
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 5,
      ),
      backgroundColor: Color(0xFF5C6EBE),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 110, 0, 0),
                child: StreamBuilder<List<ReviewRecord>>(
                  stream: queryReviewRecord(queryBuilder: (reviewRecord) => reviewRecord.where('storeidx', isEqualTo: widget.storeidx),),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: LinearProgressIndicator(
                          color: Color(0xFF2163CB),
                        ),
                      );
                    }
                    List<ReviewRecord> listViewReviewRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewReviewRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewReviewRecord =
                            listViewReviewRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where('uid',
                                          isEqualTo: listViewReviewRecord.uid),
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
                                  List<UsersRecord> columnUsersRecordList =
                                      snapshot.data;
                                  // Return an empty Container when the document does not exist.
                                  if (snapshot.data.isEmpty) {
                                    return Container();
                                  }
                                  final columnUsersRecord = columnUsersRecordList.isNotEmpty ? columnUsersRecordList.first : null;
                                  return InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 300),
                                          reverseDuration: Duration(milliseconds: 300),
                                          child: ReviewDetailWidget(
                                            re000:
                                                listViewReviewRecord.reviewId,
                                          ),
                                        ),
                                      );
                                    },
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      columnUsersRecord.displayName,
                                                      style: FlutterFlowTheme.subtitle1.override(
                                                        fontFamily: 'Lexend Deca',
                                                        color: Color(0xFF151B1E),
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 4),
                                                      child: RatingBarIndicator(
                                                        itemBuilder: (context, index) =>
                                                                Icon(
                                                                  Icons.star_rounded,
                                                                  color: Color(0xFFFFA130),
                                                        ),
                                                        direction: Axis.horizontal,
                                                        rating: listViewReviewRecord.rateAvg,
                                                        unratedColor: Color(0xFF95A1AC),
                                                        itemCount: 5,
                                                        itemSize: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Card(
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  color: Color(0xFFDBE2E7),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(40),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder: (usersRecord) => usersRecord.where('uid', isEqualTo: listViewReviewRecord.uid),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child:
                                                                LinearProgressIndicator(
                                                              color: Color(0xFF2163CB),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord> circleImageUsersRecordList = snapshot.data;
                                                        // Return an empty Container when the document does not exist.
                                                        if (snapshot.data.isEmpty) {
                                                          return Container();
                                                        }
                                                        final circleImageUsersRecord = circleImageUsersRecordList.isNotEmpty ? circleImageUsersRecordList.first : null;
                                                        return Container(
                                                          width: 50,
                                                          height: 50,
                                                          clipBehavior: Clip.antiAlias,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: Image.network(circleImageUsersRecord.photoUrl,),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    listViewReviewRecord.review,
                                                    style: FlutterFlowTheme.bodyText2.override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF8B97A2),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
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
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x39000000),
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: StreamBuilder<List<ReviewRecord>>(
                                  stream: queryReviewRecord(
                                    queryBuilder: (reviewRecord) => reviewRecord.where('storeidx', isEqualTo: widget.storeidx),
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
                                    List<ReviewRecord> textReviewRecordList =
                                        snapshot.data;
                                    return Text(
                                      formatNumber(
                                        textReviewRecordList.length,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                      ),
                                      style: FlutterFlowTheme.title1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Text(
                                '# of Ratings',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                    child:
                                        StreamBuilder<List<RepairstoreRecord>>(
                                          stream: queryRepairstoreRecord(
                                            queryBuilder: (repairstoreRecord) => repairstoreRecord.where('idx', isEqualTo: widget.storeidx),
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
                                        List<RepairstoreRecord> textRepairstoreRecordList = snapshot.data;
                                        // Return an empty Container when the document does not exist.
                                        if (snapshot.data.isEmpty) {
                                          return Container();
                                        }
                                        final textRepairstoreRecord = textRepairstoreRecordList.isNotEmpty ? textRepairstoreRecordList.first : null;
                                        return Text(
                                          formatNumber(
                                            textRepairstoreRecord.rate,
                                            formatType: FormatType.custom,
                                            format: '#.#',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.title1.override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 12),
                                    child: Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFFFFA130),
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Avg. Rating',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
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
          ],
        ),
      ),
    );
  }
}
