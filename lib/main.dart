import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double nextButtonMargin = 10.0;
  static Color mainColor = Color(0xff278bff);
  Duration _duration = Duration(milliseconds: 500);
  Curve _curve = Curves.easeInOutQuad;
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  String id = "";
  String pw = "";

  Color idBoxColor = mainColor.withOpacity(0.20);
  Color idBoxTextColor = Color(0xff000000).withOpacity(0.80);
  Color pwBoxColor = mainColor.withOpacity(0.20);
  Color pwBoxTextColor = Color(0xff000000).withOpacity(0.80);
  double pwOpacity = 0.0;
  int nowState = 0;
  String nextStr = "다음";

  void onNextClicked() {
    setState(() {
      switch (nowState) {
        case 0:
          nextButtonMargin = 93;
          idBoxColor = mainColor;
          idBoxTextColor = Colors.white;
          pwOpacity = 1.0;
          nowState += 1;
          break;

        case 1:
          pwBoxColor = mainColor;
          pwBoxTextColor = Colors.white;
          nowState += 1;
          nextStr = "올바르게 입력하셨다면 눌러주세요!";
          break;

        case 2:
          nextStr = "회원가입 중이에요..";
          Fluttertoast.showToast(msg: "id : $id, pw : $pw", timeInSecForIos: 1);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
//                width: 325.00,
                margin: EdgeInsets.only(top: 25.0, bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "가게에 날개를,",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Text(
                      "애드플라이어",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Apple SD Gothic Neo",
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 325.00,
                margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
                child: Text(
                  "ID",
                  style: TextStyle(
                    fontFamily: "Apple SD Gothic Neo",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              AnimatedContainer(
                height: 50.00,
                width: 325.00,
                decoration: BoxDecoration(
                  color: idBoxColor,
                  borderRadius: BorderRadius.circular(10.00),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    TextField(
                      controller: idController,
                      onChanged: (s) {
                        id = s;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "example@pacific9.co.kr",
                      ),
                      style: TextStyle(
                        fontFamily: "Apple SD Gothic Neo",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: idBoxTextColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        idController.clear();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 30.00,
                            width: 30.00,
                            margin: EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(7.50),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset('images/erase_small.svg',
                                width: 15,
                                height: 15,
                                color: Colors.white,
                                semanticsLabel: 'Acme Logo'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 25.0),
                duration: _duration,
                curve: _curve,
              ),
              AnimatedContainer(
                duration: _duration,
                curve: _curve,
                child: Stack(
                  children: <Widget>[
                    AnimatedOpacity(
                      duration: _duration,
                      curve: _curve,
                      opacity: pwOpacity,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 325.00,
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            child: Container(
                                margin: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "비밀번호",
                                  style: TextStyle(
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                  ),
                                )),
                          ),
                          AnimatedContainer(
                            height: 50.00,
                            width: 325.00,
                            decoration: BoxDecoration(
                              color: pwBoxColor,
                              borderRadius: BorderRadius.circular(10.00),
                            ),
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: <Widget>[
                                TextField(
                                  controller: pwController,
                                  onChanged: (s) {
                                    pw = s;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Password",
                                  ),
                                  style: TextStyle(
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: pwBoxTextColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    pwController.clear();
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 30.00,
                                        width: 30.00,
                                        margin: EdgeInsets.only(right: 10.0),
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(7.50),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        child: SvgPicture.asset(
                                            'images/erase_small.svg',
                                            width: 15,
                                            height: 15,
                                            color: Colors.white,
                                            semanticsLabel: 'Acme Logo'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 25.0),
                            margin: EdgeInsets.only(bottom: 10.0),
                            duration: _duration,
                            curve: _curve,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        AnimatedContainer(
                          duration: _duration,
                          curve: _curve,
                          margin: EdgeInsets.only(top: nextButtonMargin),
                          child: Material(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10.00),
                            child: InkWell(
                              onTap: onNextClicked,
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.00,
                                width: 325.00,
                                child: Text(
                                  nextStr,
                                  style: TextStyle(
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "로그인을 원하시나요?",
                              style: TextStyle(
                                fontFamily: "Apple SD Gothic Neo",
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: mainColor,
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
      ),
    );
  }
}
