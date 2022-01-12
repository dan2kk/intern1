import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../fix_order/fix_order_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_rive_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../review_list/review_list_widget.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RepairmentStoreDetailWidget extends StatefulWidget {
  const RepairmentStoreDetailWidget({
    Key key,
    this.stidx,
  }) : super(key: key);

  final int stidx;

  @override
  _RepairmentStoreDetailWidgetState createState() =>
      _RepairmentStoreDetailWidgetState();
}

class _RepairmentStoreDetailWidgetState
    extends State<RepairmentStoreDetailWidget> {
  PageController pageViewController;
  final riveAnimationAnimationsList = [
    'Animation 1', 'Animation 2',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
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
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RepairstoreRecord>>(
      stream: queryRepairstoreRecord(
        queryBuilder: (repairstoreRecord) =>
            repairstoreRecord.where('idx', isEqualTo: widget.stidx),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: RiveAnimation.asset(
                  'assets/rive_animations/loading.riv',
                  artboard: 'New Artboard',
                  fit: BoxFit.cover,
                  controllers: riveAnimationControllers,
                ),
              )
          );
        }
        List<RepairstoreRecord> repairmentStoreDetailRepairstoreRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final repairmentStoreDetailRepairstoreRecord =
            repairmentStoreDetailRepairstoreRecordList.isNotEmpty
                ? repairmentStoreDetailRepairstoreRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFF3F51B5),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_left,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              repairmentStoreDetailRepairstoreRecord
                                                  .name,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.title1
                                                  .override(
                                                fontFamily: 'tway_air medium',
                                                color: Color(0xFFFBFBF6),
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 320,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBE2E7),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Builder(
                                        builder: (context) {
                                          final image =
                                              repairmentStoreDetailRepairstoreRecord
                                                      .imgUrl
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                          return Container(
                                            width: double.infinity,
                                            height: 500,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 50),
                                                  child: PageView.builder(
                                                    controller: pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                repairmentStoreDetailRepairstoreRecord
                                                                    .imgUrl
                                                                    .toList()
                                                                    .length,
                                                                image.length -
                                                                    1)),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: image.length,
                                                    itemBuilder:
                                                        (context, imageIndex) {
                                                      final imageItem =
                                                          image[imageIndex];
                                                      return Image.network(
                                                        imageItem,
                                                        width: 100,
                                                        height: 100,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 1),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 10),
                                                    child: SmoothPageIndicator(
                                                      controller: pageViewController ??=
                                                          PageController(
                                                              initialPage: min(
                                                                  repairmentStoreDetailRepairstoreRecord
                                                                      .imgUrl
                                                                      .toList()
                                                                      .length,
                                                                  image.length -
                                                                      1)),
                                                      count: image.length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) {
                                                        pageViewController
                                                            .animateToPage(
                                                          i,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      effect:
                                                          ExpandingDotsEffect(
                                                        expansionFactor: 2,
                                                        spacing: 8,
                                                        radius: 16,
                                                        dotWidth: 16,
                                                        dotHeight: 16,
                                                        dotColor:
                                                            Color(0xFF9E9E9E),
                                                        activeDotColor:
                                                            Color(0xFF3F51B5),
                                                        paintStyle:
                                                            PaintingStyle.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.1, 0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Color(0x3A050505),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    buttonSize: 46,
                                                    icon: Icon(
                                                      Icons.arrow_back_rounded,
                                                      color: Colors.white,
                                                      size: 24,
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0x3A050505),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (!(FFAppState()
                                                            .favorites
                                                            .contains(widget
                                                                .stidx)) ??
                                                        true)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        buttonSize: 46,
                                                        icon: Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.white,
                                                          size: 24,
                                                        ),
                                                        onPressed: () async {
                                                          setState(() => FFAppState()
                                                              .addToFavorites(
                                                                  widget
                                                                      .stidx));
                                                          final usersUpdateData =
                                                              {
                                                            'favorites':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              widget.stidx
                                                            ]),
                                                          };
                                                          await currentUserReference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                      ),
                                                    if (FFAppState()
                                                            .favorites
                                                            .contains(
                                                                widget.stidx) ??
                                                        true)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        buttonSize: 46,
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          size: 24,
                                                        ),
                                                        onPressed: () async {
                                                          setState(() => FFAppState()
                                                              .removeFromFavorites(
                                                                  widget
                                                                      .stidx));
                                                          final usersUpdateData =
                                                              {
                                                            'favorites':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              widget.stidx
                                                            ]),
                                                          };
                                                          await currentUserReference
                                                              .update(
                                                                  usersUpdateData);
                                                        },
                                                      ),
                                                  ],
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
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                repairmentStoreDetailRepairstoreRecord.address,
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RatingBarIndicator(
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFFA130),
                                ),
                                direction: Axis.horizontal,
                                rating:
                                    valueOrDefault(repairmentStoreDetailRepairstoreRecord.rate, 0),
                                unratedColor: Color(0xFF95A1AC),
                                itemCount: 5,
                                itemSize: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: StreamBuilder<List<ReviewRecord>>(
                                  stream: queryReviewRecord(
                                    queryBuilder: (reviewRecord) =>
                                        reviewRecord.where('storeidx',
                                            isEqualTo:
                                                repairmentStoreDetailRepairstoreRecord
                                                    .idx),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          height: MediaQuery.of(context).size.height * 0.1,
                                          child: RiveAnimation.asset(
                                            'assets/rive_animations/loading.riv',
                                            artboard: 'New Artboard',
                                            fit: BoxFit.cover,
                                            controllers: riveAnimationControllers,
                                          ),
                                        )
                                          );
                                    }
                                    List<ReviewRecord> textReviewRecordList =
                                        snapshot.data;
                                    return InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ReviewListWidget(
                                              storeidx:
                                                  repairmentStoreDetailRepairstoreRecord
                                                      .idx,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        '${valueOrDefault(textReviewRecordList.length.toString(), '0')} 리뷰',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF8B97A2),
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '업체 상세설명',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF262D34),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Text(
                                    valueOrDefault(repairmentStoreDetailRepairstoreRecord
                                        .explain, "내무"),
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: InkWell(
                    onTap: () async {
                      if ((currentUserUid) == '') {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: LoginPageWidget(),
                          ),
                        );
                      }
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FixOrderWidget(
                            storeidx: widget.stidx,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFF14181B),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x55000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: RiveAnimation.asset(
                                'assets/rive_animations/1435-2808-scrolling-letter.riv',
                                artboard: 'New Artboard',
                                fit: BoxFit.cover,
                                controllers: riveAnimationControllers,
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
        );
      },
    );
  }
}
