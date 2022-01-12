import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../order_complete/order_complete_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class FixOrderWidget extends StatefulWidget {
  const FixOrderWidget({
    Key key,
    this.storeidx,
  }) : super(key: key);

  final int storeidx;

  @override
  _FixOrderWidgetState createState() => _FixOrderWidgetState();
}

class _FixOrderWidgetState extends State<FixOrderWidget> {
  DateTime datePicked;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  TextEditingController textController1;
  TextEditingController textController2;
  bool picturevideoValue = true;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  bool switchListTileValue = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RepairstoreRecord>>(
      stream: queryRepairstoreRecord(
        queryBuilder: (repairstoreRecord) =>
            repairstoreRecord.where('idx', isEqualTo: widget.storeidx),
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
        List<RepairstoreRecord> fixOrderRepairstoreRecordList = snapshot.data;
        final fixOrderRepairstoreRecord =
        fixOrderRepairstoreRecordList.isNotEmpty
            ? fixOrderRepairstoreRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0x00F6F1F1),
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              '견적문의',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'tway_air medium',
                color: Color(0xFF3F51B5),
                fontSize: 36,
                fontWeight: FontWeight.w500,
                useGoogleFonts: false,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFEEEEEE),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.38,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Stack(
                                          children: [
                                            if (picturevideoValue ?? true)
                                              Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
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
                                                            selectedMedia
                                                                .storagePath,
                                                            context)) {
                                                      showUploadMessage(context,
                                                          'Uploading file...',
                                                          showLoading: true);
                                                      final downloadUrl =
                                                      await uploadData(
                                                          selectedMedia
                                                              .storagePath,
                                                          selectedMedia
                                                              .bytes);
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .hideCurrentSnackBar();
                                                      if (downloadUrl != null) {
                                                        setState(() =>
                                                        uploadedFileUrl1 =
                                                            downloadUrl);
                                                        showUploadMessage(
                                                            context,
                                                            'Success!');
                                                      } else {
                                                        showUploadMessage(
                                                            context,
                                                            'Failed to upload media');
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      uploadedFileUrl2,
                                                      'https://firebasestorage.googleapis.com/v0/b/ttak-tta-gu-ri.appspot.com/o/repairment%2Fvideo%20%EC%B4%88%EA%B9%83%EA%B0%92.JPG?alt=media&token=1efb466d-2eda-4241-b72c-25a918947d38',
                                                    ),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            if (!(picturevideoValue) ?? true)
                                              Align(
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                          null &&
                                                          validateFileFormat(
                                                              selectedMedia
                                                                  .storagePath,
                                                              context)) {
                                                        showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true);
                                                        final downloadUrl =
                                                        await uploadData(
                                                            selectedMedia
                                                                .storagePath,
                                                            selectedMedia
                                                                .bytes);
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .hideCurrentSnackBar();
                                                        if (downloadUrl !=
                                                            null) {
                                                          setState(() =>
                                                          uploadedFileUrl2 =
                                                              downloadUrl);
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload media');
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        uploadedFileUrl1,
                                                        'https://firebasestorage.googleapis.com/v0/b/ttak-tta-gu-ri.appspot.com/o/repairment%2F%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EC%B4%88%EA%B9%83%EA%B0%92.JPG?alt=media&token=2e283c3a-2d59-4fe8-b97b-2a78784687e9',
                                                      ),
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '고장 제품 정보:',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'tway_air medium',
                                                  color: Color(0xFF3F51B5),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 330,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    border: Border.all(
                                                      color: Color(0xFFE6E6E6),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                      textController1,
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: '제조사',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color:
                                                          Color(0xFF8B97A2),
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                        enabledBorder:
                                                        UnderlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                            topRight:
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                        UnderlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                            topRight:
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color:
                                                        Color(0xFF8B97A2),
                                                        fontWeight:
                                                        FontWeight.w500,
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
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 330,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    border: Border.all(
                                                      color: Color(0xFFE6E6E6),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 0, 0),
                                                    child: TextFormField(
                                                      controller:
                                                      textController2,
                                                      obscureText: false,
                                                      decoration:
                                                      InputDecoration(
                                                        labelText: '모델명',
                                                        labelStyle:
                                                        FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily:
                                                          'tway_air medium',
                                                          color:
                                                          Color(0xFF8B97A2),
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                                        enabledBorder:
                                                        UnderlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                            topRight:
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                        UnderlineInputBorder(
                                                          borderSide:
                                                          BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                            topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                            topRight:
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'tway_air medium',
                                                        color:
                                                        Color(0xFF8B97A2),
                                                        fontWeight:
                                                        FontWeight.w500,
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
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 330,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    border: Border.all(
                                                      color: Color(0xFFE6E6E6),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15, 0,
                                                            0, 0),
                                                        child: Text(
                                                          '동영상 여부',
                                                          style:
                                                          FlutterFlowTheme
                                                              .bodyText1
                                                              .override(
                                                            fontFamily:
                                                            'tway_air medium',
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            useGoogleFonts:
                                                            false,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SwitchListTile
                                                            .adaptive(
                                                          value:
                                                          picturevideoValue ??=
                                                          false,
                                                          onChanged: (newValue) =>
                                                              setState(() =>
                                                              picturevideoValue =
                                                                  newValue),
                                                          tileColor:
                                                          Color(0xFFF5F5F5),
                                                          dense: false,
                                                          controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                          child: Text(
                                            '고장 부위:',
                                            style: TextStyle(
                                              fontFamily: 'tway_air medium',
                                              color: Color(0xFF3F51B5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 1, 0, 0),
                                        child: TextFormField(
                                          controller: textController3,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '고장 부위를 입력하시오..',
                                            hintStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'tway_air medium',
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                              const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 10, 0, 0),
                                  child: TextFormField(
                                    controller: textController4,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: '상세 증상',
                                      hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'tway_air medium',
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
                                    ),
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'tway_air medium',
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
                  ),
                  if (switchListTileValue ?? true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: TextFormField(
                            controller: textController5,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: '주소',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'tway_air medium',
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
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'tway_air medium',
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (switchListTileValue ?? true)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (switchListTileValue ?? true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await DatePicker.showDateTimePicker(
                                  context,
                                  showTitleActions: true,
                                  onConfirm: (date) {
                                    setState(() => datePicked = date);
                                  },
                                  currentTime: getCurrentTimestamp,
                                  minTime: getCurrentTimestamp,
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height:
                                MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '픽업 희망 시간:',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Color(0xFF323BD3),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          dateTimeFormat(
                                              'M/d h:m a', datePicked),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'tway_air medium',
                                            color: Colors.black,
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
                          ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.6,
                                  height: 50,
                                  constraints: BoxConstraints(
                                    maxWidth:
                                    MediaQuery.of(context).size.width *
                                        0.65,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: SwitchListTile(
                                    value: switchListTileValue ??= true,
                                    onChanged: (newValue) => setState(
                                            () => switchListTileValue = newValue),
                                    title: Text(
                                      '직접방문/ 픽업',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'tway_air medium',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    dense: true,
                                    controlAffinity:
                                    ListTileControlAffinity.leading,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.35,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final repairmentCreateData =
                                        createRepairmentRecordData(
                                          storeidx: widget.storeidx,
                                          userid: currentUserUid,
                                          category: fixOrderRepairstoreRecord
                                              .category,
                                          manufacture: textController1.text,
                                          model: textController2.text,
                                          brokenPart: textController3.text,
                                          symptom: textController4.text,
                                          imgUrl: uploadedFileUrl2,
                                          pickupDirect: switchListTileValue,
                                          address: textController5.text,
                                          status: 1,
                                          repairmentid:
                                          '${currentUserUid};;${fixOrderRepairstoreRecord.storeidx.toString()};;${getCurrentTimestamp.toString()}',
                                          timestamp: getCurrentTimestamp,
                                          videoUrl: uploadedFileUrl1,
                                          select: datePicked,
                                        );
                                        await RepairmentRecord.collection
                                            .doc()
                                            .set(repairmentCreateData);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OrderCompleteWidget(),
                                          ),
                                        );
                                      },
                                      text: '견적문의',
                                      icon: Icon(
                                        Icons.add_to_home_screen_outlined,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 150,
                                        height: 50,
                                        color: Color(0xFF4B39EF),
                                        textStyle:
                                        FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'tway_air medium',
                                          color: Colors.white,
                                          fontSize: 16,
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
            ),
          ),
        );
      },
    );
  }
}
