import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin/flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:studentapp/net/Code.dart';
import 'package:studentapp/net/ResultData.dart';
import 'dart:collection';
import 'package:studentapp/util/LocalSharePreferences.dart';
import 'package:studentapp/net/Config.dart';
import 'dart:io';
import 'package:studentapp/net/Address.dart';

class Api {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static String uuid;
  static int version = 0;
  static String systemMark;
  static String phoneMark;

//  //通过本地获取系统的版本号
//  static Future _getVersion() async {
//    try {
//      return await FlutterPlugin.getVersion;
//    } on PlatformException catch (e) {
//      print(e.message);
//    }
//  }
//
//  //通过本地获取系统的SDK
//  static Future<Null> _getsystemMark() async {
//    try {
//      return await FlutterPlugin.getsystemMark;
//    } on PlatformException catch (e) {
//      print(e.message);
//    }
//  }
//
//  //通过本地获取系统的phoneMark
//  static Future<Null> _getphoneMark() async {
//    try {
//      return await FlutterPlugin.getphoneMark;
//    } on PlatformException catch (e) {
//      print(e.message);
//    }
//  }
//
//  //通过本地获取系统的phoneMark
//  static Future<Null> _getUuid() async {
//    try {
//      uuid = await FlutterPlugin.getUuid;
//      return await FlutterPlugin.getUuid;
//    } on PlatformException catch (e) {
//      print(e.message);
//    }
//  }
//  static Map comParams = {
//    "token": null,
//    "time": new DateTime.now().millisecondsSinceEpoch,
//    "uniqueId":  uuid,
//    "phoneMark":phoneMark,
//    "systemMark": systemMark,
//    "platForm": defaultTargetPlatform == TargetPlatform.android ? 1 : 2,
//    "version":version,
//  };
  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static netFetch(url, pragams, Map<String, String> header, Options optins,
      {noTip = false}) async {
    uuid = await FlutterPlugin.getUuid;
    phoneMark = await FlutterPlugin.getphoneMark;
    version = await FlutterPlugin.getVersion;
    systemMark = await FlutterPlugin.getsystemMark;

    Map comParams = {
    "token":null,
    "time":new DateTime.now().millisecondsSinceEpoch,
    "uniqueId":uuid,
    "phoneMark":phoneMark,
    "systemMark":systemMark,
    "platForm":defaultTargetPlatform == TargetPlatform.android ? 1 : 2,
    "version":version,
  };
    /// 没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ResultData(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "没有网络", noTip),
          false,
          Code.NETWORK_ERROR);
    }

    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (pragams != null) {
      comParams.addAll(pragams);
    }

    if (comParams["token"] == null){
        var token = await getToken();
        if (token != null) {
          comParams["token"] = token;
        }
    }
//    headers["token"] = optionParams["token"];
//    datas["time"] = optionParams["time"];
//    datas["uniqueId"] = optionParams["uniqueId"];
//    datas["phoneMark"] = optionParams["phoneMark"];
//    datas["systemMark"] = optionParams["systemMark"];
//    datas["platForm"] = optionParams["platForm"];
//    datas["version"] = optionParams["version"];

    if (optins != null) {
      optins.headers = headers;
      optins.baseUrl = Address.BASE_URL;
      optins.connectTimeout = 15000;
      optins.contentType =  ContentType.parse("application/x-www-form-urlencoded");

    } else{
      optins = new Options(method: "get");
      optins.headers = headers;
      optins.baseUrl = Address.BASE_URL;
      optins.connectTimeout = 15000;
      optins.contentType =  ContentType.parse("application/x-www-form-urlencoded");
    }

    Dio dio = new Dio();
    Response response;
    try{
      response = await dio.request(url,data: comParams,options: optins);
    }on DioError catch(e){
      Response errorResponse;
      if (e.response != null){
        errorResponse = e.response;
      }
      else{
        /// 666是我自己写的状态码,表示没有返回错误信息
        errorResponse = new Response(statusCode: 666);
      }

      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Config.DEBUG) {
        print('请求异常: ' + e.toString());
        print('请求异常url: ' + url);
      }
      new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    if (Config.DEBUG) {
      print('请求url: ' + url);
      print('请求头: ' + optins.headers.toString());
      if (pragams != null) {
        print('请求参数: ' + comParams.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
      if (comParams["token"] != null) {
        print('token: ' + comParams["token"]);
      }
    }

    try {
//      if (optins.contentType != null) {
//        return new ResultData(response.data, true, Code.SUCCESS);
//      } else {
//        var
// = response.data;
//        if (response.statusCode == 201 && responseJson["token"] != null) {
//          comParams["token"] = responseJson["token"];
//          await LocalSharePreferences.saveString(Config.TOKEN_KEY, comParams["token"]);
//        }
//      }
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        return new ResultData(response.data, true, Code.SUCCESS, header: response.headers);
//      }
        var responseJson = response.data;
        if (response.statusCode == 200 && responseJson["token"] != null){
          comParams["token"] = responseJson["token"];
          await LocalSharePreferences.saveString(Config.TOKEN_KEY, comParams["token"]);
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          return new ResultData(response.data, true, Code.SUCCESS, header: response.headers);
        }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(response.data, false, response.statusCode, header: response.headers);
    }
//    return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
  }

//  ///清除授权
//  static clearToken() {
//    comParams["token"] = null;
//    LocalSharePreferences.remove(Config.TOKEN_KEY);
//  }

  ///获取授权token
  static getToken() async {
    String token = await LocalSharePreferences.get(Config.TOKEN_KEY);
    return token;
  }
}
