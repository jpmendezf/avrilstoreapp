import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/middlewares/group_middleware.dart';
import 'package:active_ecommerce_flutter/middlewares/middleware.dart';
import 'package:active_ecommerce_flutter/repositories/aiz_api_response.dart';
import 'package:http/http.dart' as http;



class ApiRequest{

  static Future<http.Response> get({required String url, Map<String,String>? headers,Middleware? middleware,GroupMiddleware? groupMiddleWare})async{
    Uri uri = Uri.parse(url);
    Map<String,String>? headerMap={
      "Accept": "application/json",
      "Content-Type": "application/json",
      "App-Language": app_language.$!,
    };
    if(headers!=null){
      headerMap.addAll(headers);
    }
    print(headerMap);
  var response =    await http.get(uri,headers: headerMap);
    return AIZApiResponse.check(response,middleware: middleware,groupMiddleWare: groupMiddleWare);
  }

  static Future<http.Response> post({required String url, Map<String,String>? headers,required String body,Middleware? middleware,GroupMiddleware? groupMiddleWare})async{
    Uri uri = Uri.parse(url);
    Map<String,String>? headerMap={
      "Content-Type": "application/json",
      "App-Language": app_language.$!,
      "Accept": "application/json",
    };
    if(headers!=null){
      headerMap.addAll(headers);
    }
  var response =    await http.post(uri,headers: headerMap,body: body);

    return AIZApiResponse.check(response,middleware: middleware,groupMiddleWare: groupMiddleWare);
  }

  static Future<http.Response> delete({required String url, Map<String,String>? headers,Middleware? middleware,GroupMiddleware? groupMiddleWare})async{
    Uri uri = Uri.parse(url);
    Map<String,String>? headerMap={
      "Content-Type": "application/json",
      "App-Language": app_language.$!,
      "Accept": "application/json",
    };
    if(headers!=null){
      headerMap.addAll(headers);
    }
    var response =    await http.delete(uri,headers: headerMap);
    return AIZApiResponse.check(response,middleware: middleware,groupMiddleWare: groupMiddleWare);
  }

}