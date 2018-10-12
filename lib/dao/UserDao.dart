import 'dart:async';
import 'package:studentapp/util/LocalSharePreferences.dart';
import 'package:studentapp/net/Config.dart';
import 'package:crypto/crypto.dart';
import 'package:studentapp/strings/Strings.dart';
import 'dart:convert';
import 'package:studentapp/net/Api.dart';
import 'package:studentapp/net/Address.dart';
import 'package:dio/dio.dart';
import 'package:studentapp/dao/DaoResult.dart';
import 'dart:io';

class UserDao {
  /// 发起登录网络请求
  /// [username] 登录名
  /// [password] 登录密码
  static getLogin(username, password) async {
    Map requestParams = {
      "account": username,
      "password": md5.convert(utf8.encode(password + Strings.MD5_P_MARK)).toString(),
      "realPassword": password,
      "loginType": 2,
    };

    var res = await Api.netFetch(Address.URL_LOGIN, requestParams, null, new Options(method: "post"),);
    if (res != null&&res.result){
      await LocalSharePreferences.saveString(Config.USER_NAME_KEY, username);
      await LocalSharePreferences.saveString(Config.PW_KEY, password);
      await LocalSharePreferences.saveString(Config.TOKEN_KEY, res.data["token"]);
      if (Config.DEBUG) {
        print("user result " + res.result.toString());
        print(res.data.toString());
      }
    }
    return new DataResult(res.data, res.result);
  }
}
