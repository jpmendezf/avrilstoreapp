import 'dart:convert';

import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/data_model/business_setting_response.dart';
import 'package:active_ecommerce_flutter/repositories/api-request.dart';

class BusinessSettingRepository {
  Future<List<BusinessSettingListResponse>> getBusinessSettingList() async {
    String url = ("${AppConfig.BASE_URL}/business-settings");

    var businessSettings = [
      "facebook_login",
      "google_login",
      "twitter_login",
      "pickup_point",
      "wallet_system",
      "email_verification",
      "conversation_system",
      "shipping_type",
      "classified_product",
      "google_recaptcha",
      "vendor_system_activation"
    ];
    String params = businessSettings.join(',');
    var body = {
      //'keys':params
      "keys": params
    };
    //print("business ${body}");
    var response = await ApiRequest.post(url: url, body: jsonEncode(body));

    print("business ${response.body}");

    return businessSettingListResponseFromJson(response.body);
  }
}
