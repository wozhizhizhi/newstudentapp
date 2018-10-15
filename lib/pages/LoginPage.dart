import 'package:flutter/material.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'package:studentapp/dao/UserDao.dart';
import 'package:studentapp/util/LocalSharePreferences.dart';
import 'package:studentapp/net/Config.dart';
import 'package:studentapp/pages/HomePage.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usetNameEditingController =
      new TextEditingController();
  TextEditingController _passWordEditingController =
      new TextEditingController();
  String name , pw;

  void textIs() async{
    String name = await LocalSharePreferences.get(Config.USER_NAME_KEY);
    String password = await LocalSharePreferences.get(Config.PW_KEY);
    setState(() {
      name = name;
      pw = password;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textIs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new FittedBox(
            child: new Image.asset("images/login_img_bg.png"),
          ),
          buildLogin(),
        ],
      ),
    );
  }
  // 登录请求接口
  void _getLoginData(String account, String realPassword) async {
   var resultData = await UserDao.getLogin(account, realPassword);
    if (resultData.data["token"] != null && resultData.data["token"] != ""){
//      Navigator.of(context).pop(true);
//      Navigator.popAndPushNamed(context, "/homepage");
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }
  Widget buildLogin() {
    return new Column(
      children: <Widget>[
//        new Container(
//          child: new Image.asset(
//            "images/login_logo.png",
//            width: 120.0,
//            height: 120.0,
//          ),
//          alignment: Alignment.topCenter,
//          padding: const EdgeInsets.only(top: 80.0),
//        ),
        new Container(
          width: 300.0,
          margin: const EdgeInsets.only(top: 215.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Container(
                    child: new Image.asset(
                      "images/img_login_user.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                    padding: const EdgeInsets.only(left: 10.0),
                  ),
                  new Flexible(
                    child: new Container(
                      child: new TextField(
                        keyboardType: TextInputType.phone,
                        controller: _usetNameEditingController,
                        decoration: new InputDecoration.collapsed(
                          hintText: "请输入手机号码",
                          hintStyle: new TextStyle(fontSize: 15.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
              new Padding(
                child: new Divider(),
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    child: new Image.asset(
                      "images/img_login_pwd.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                    padding: const EdgeInsets.only(left: 10.0),
                  ),
                  new Flexible(
                    child: new Container(
                      child: new TextField(
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        controller: _passWordEditingController,
                        decoration: new InputDecoration.collapsed(
                          hintText: "请输入密码",
                          hintStyle: new TextStyle(fontSize: 15.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // 装饰设置外围的圆角,里面为白色
          decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
              color: Colors.white),
        ),
        new GestureDetector(
          child: new Container(
            child: new Text(
              "忘记密码",
              style: new TextStyle(color: Colors.white),
            ),
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 35.0, top: 10.0),
          ),
          onTap: () {
            return Navigator.push(context,
                new MaterialPageRoute(builder: (context) {
//                  return new RegisteredPage();
            }));
          },
        ),
        new Flexible(
          child: new Container(
            width: 250.0,
            height: 70.0,
            padding: const EdgeInsets.only(top: 30.0),
            child: new RaisedButton(
              onPressed: () {
                if (_usetNameEditingController.value.text.toString().trim() !=
                        "" &&
                    _passWordEditingController.value.text.toString().trim() !=
                        "") {
                  String account = _usetNameEditingController.value.text;
                  String passWord = _passWordEditingController.value.text;
                  _getLoginData(account, passWord);
//                  var resultData = UserDao.getLogin(account, passWord);



                } else {
                  // 这样写有问题！可以在最外层new Builder
                    Scaffold.of(context).showSnackBar(
                          new SnackBar(
                            content: new Text("请先输入账号或者密码"),
                          ),
                        );
                }
              },
              child: new Text(
                "登录",
                style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.blue,
                ),
              ),
              color: Colors.yellow,
              shape: new StadiumBorder(),
            ),
          ),
        ),

        new Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(top: 55.0),
          child: new OutlineButton(
            onPressed: null,
            child: new Text(
              "微信登录",
              style: new TextStyle(color: StudentColors.s_22b2e1, fontSize: 14.0),
            ),
            shape: new StadiumBorder(),
            borderSide: BorderSide(width: 1.0),
          ),
        ),

        new Container(
          alignment: Alignment.bottomCenter,
          child: new OutlineButton(
            onPressed: null,
            child: new Text(
              "出来报到?注册请戳这里",
              style: new TextStyle(color: StudentColors.s_22b2e1, fontSize: 14.0),
            ),
            shape: new StadiumBorder(),
            borderSide: BorderSide(width: 1.0),
          ),
        ),
      ],
    );
  }

}
