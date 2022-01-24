import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewAddedCOMPLETEWidget extends StatefulWidget {
  const ReviewAddedCOMPLETEWidget({Key key}) : super(key: key);

  @override
  _ReviewAddedCOMPLETEWidgetState createState() =>
      _ReviewAddedCOMPLETEWidgetState();
}

class _ReviewAddedCOMPLETEWidgetState extends State<ReviewAddedCOMPLETEWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFF21B6FF),
                        size: 70,
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '리뷰 작성 완료',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'tway_air medium',
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'tway_air medium',
                                color: Color(0xFF5C6EBE),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '포인트 적립',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'tway_air medium',
                                color: Color(0xFF5C6EBE),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '소중한 리뷰 감사합니다',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'tway_air medium',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'MainPage'),
                                  ),
                                );
                              },
                              text: '메인 화면',
                              options: FFButtonOptions(
                                height: 30,
                                color: Color(0xFF21B6FF),
                                textStyle: TextStyle(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'MyPage'),
                                  ),
                                );
                              },
                              text: '마이 페이지',
                              options: FFButtonOptions(
                                height: 30,
                                color: Color(0xFF21B6FF),
                                textStyle: TextStyle(
                                  fontFamily: 'tway_air medium',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
