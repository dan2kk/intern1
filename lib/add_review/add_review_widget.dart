import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../review_added_c_o_m_p_l_e_t_e/review_added_c_o_m_p_l_e_t_e_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class AddReviewWidget extends StatefulWidget {
  const AddReviewWidget({
    Key key,
    this.repairmentid,
  }) : super(key: key);

  final String repairmentid;

  @override
  _AddReviewWidgetState createState() => _AddReviewWidgetState();
}

class _AddReviewWidgetState extends State<AddReviewWidget> {
  ReviewRecord rrrr;
  PointsRecord aaaaaa;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  bool picturevideoValue;
  double ratingBarValue1;
  double ratingBarValue2;
  double ratingBarValue3;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RepairmentRecord>>(
      stream: queryRepairmentRecord(
        queryBuilder: (repairmentRecord) => repairmentRecord
            .where('repairmentid', isEqualTo: widget.repairmentid),
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
        List<RepairmentRecord> addReviewRepairmentRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final addReviewRepairmentRecord =
            addReviewRepairmentRecordList.isNotEmpty
                ? addReviewRepairmentRecordList.first
                : null;
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
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 40, 0, 0),
                                  child: Text(
                                    '리뷰 작성',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'tway_air medium',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where('uid',
                          isEqualTo: addReviewRepairmentRecord.userid),
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
                      List<UsersRecord> rowUsersRecordList = snapshot.data;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data.isEmpty) {
                        return Container();
                      }
                      final rowUsersRecord = rowUsersRecordList.isNotEmpty
                          ? rowUsersRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Image.network(
                                rowUsersRecord.photoUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                            child: Container(
                              width: 100,
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
                                      Text(
                                        addReviewRepairmentRecord.manufacture,
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          rowUsersRecord.displayName,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Color(0xFF4B39EF),
                                            fontSize: 17,
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
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          '사진 첨부',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'tway_air medium',
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Stack(
                        children: [
                          if (!(picturevideoValue) ?? true)
                            InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    validateFileFormat(
                                        selectedMedia.storagePath, context)) {
                                  showUploadMessage(
                                      context, 'Uploading file...',
                                      showLoading: true);
                                  final downloadUrl = await uploadData(
                                      selectedMedia.storagePath,
                                      selectedMedia.bytes);
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  if (downloadUrl != null) {
                                    setState(
                                        () => uploadedFileUrl1 = downloadUrl);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }
                              },
                              child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/ttak-tta-gu-ri.appspot.com/o/repairment%2F%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EC%B4%88%EA%B9%83%EA%B0%92.JPG?alt=media&token=2e283c3a-2d59-4fe8-b97b-2a78784687e9',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          if (picturevideoValue ?? true)
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: InkWell(
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: false,
                                    allowVideo: true,
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                        context, 'Uploading file...',
                                        showLoading: true);
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl2 = downloadUrl);
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }
                                },
                                child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/ttak-tta-gu-ri.appspot.com/o/repairment%2Fvideo%20%EC%B4%88%EA%B9%83%EA%B0%92.JPG?alt=media&token=1efb466d-2eda-4241-b72c-25a918947d38',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: SwitchListTile.adaptive(
                          value: picturevideoValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => picturevideoValue = newValue),
                          title: Text(
                            '동영상 첨부',
                            style: FlutterFlowTheme.title2.override(
                              fontFamily: 'tway_air medium',
                              color: FlutterFlowTheme.tertiaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 0, 0),
                                  child: Text(
                                    '수리 만족도',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'tway_air medium',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                  child: Text(
                                    '친절도',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'tway_air medium',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 0, 0),
                                  child: Text(
                                    '견적 정확도',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'tway_air medium',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              width: 20,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) =>
                                    setState(() => ratingBarValue1 = newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFF323BD3),
                                ),
                                direction: Axis.horizontal,
                                initialRating: ratingBarValue1 ??= 3,
                                unratedColor: Color(0xFF9E9E9E),
                                itemCount: 5,
                                itemSize: 30,
                                glowColor: Color(0xFF323BD3),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) =>
                                    setState(() => ratingBarValue2 = newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFF323BD3),
                                ),
                                direction: Axis.horizontal,
                                initialRating: ratingBarValue2 ??= 3,
                                unratedColor: Color(0xFF9E9E9E),
                                itemCount: 5,
                                itemSize: 30,
                                glowColor: Color(0xFF323BD3),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: RatingBar.builder(
                                onRatingUpdate: (newValue) =>
                                    setState(() => ratingBarValue3 = newValue),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFF323BD3),
                                ),
                                direction: Axis.horizontal,
                                initialRating: ratingBarValue3 ??= 3,
                                unratedColor: Color(0xFF9E9E9E),
                                itemCount: 5,
                                itemSize: 30,
                                glowColor: Color(0xFF323BD3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: TextFormField(
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '리뷰 작성',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'tway_air medium',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(220, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final reviewCreateData = {
                            ...createReviewRecordData(
                              uid: addReviewRepairmentRecord.userid,
                              timestamp: getCurrentTimestamp,
                              storeidx: addReviewRepairmentRecord.storeidx,
                              review: textController.text,
                              uName: addReviewRepairmentRecord.userid,
                              reviewId: widget.repairmentid,
                              rateAvg: functions.avg(ratingBarValue1,
                                  ratingBarValue2, ratingBarValue3),
                            ),
                            'photo_url': [uploadedFileUrl1],
                          };
                          final reviewRecordReference =
                              ReviewRecord.collection.doc();
                          await reviewRecordReference.set(reviewCreateData);
                          rrrr = ReviewRecord.getDocumentFromData(
                              reviewCreateData, reviewRecordReference);

                          final repairmentUpdateData =
                              createRepairmentRecordData(
                            status: 7,
                          );
                          await addReviewRepairmentRecord.reference
                              .update(repairmentUpdateData);

                          final pointsCreateData = createPointsRecordData(
                            amount: 500,
                            expireDate: getCurrentTimestamp,
                            earnedDate: getCurrentTimestamp,
                            reason: '리뷰 작성으로 인한 포인트 적립',
                          );
                          final pointsRecordReference =
                              PointsRecord.collection.doc();
                          await pointsRecordReference.set(pointsCreateData);
                          aaaaaa = PointsRecord.getDocumentFromData(
                              pointsCreateData, pointsRecordReference);

                          final usersUpdateData = {
                            'point': FieldValue.increment(500),
                            'point_his':
                                FieldValue.arrayUnion([aaaaaa.reference]),
                          };
                          await currentUserReference.update(usersUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewAddedCOMPLETEWidget(),
                            ),
                          );

                          setState(() {});
                        },
                        text: '리뷰 작성',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0xFF4B39EF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'tway_air medium',
                            color: Colors.white,
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
                    ],
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
