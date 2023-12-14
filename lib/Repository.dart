import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class BikeModel {
  int? id;
  String? displayname;
  String? image;
  double? rating;
  Map<String, dynamic>? cc;
  Map<String, dynamic>? mileage;
  double? ex_showroom_price;
  double? minimum_omi;
  int? city_id;
  String? city_name;
  int? make_id;
  String? make_slug;
  String? make_name;
  int? model_id;
  String? model_slug;
  String? model_name;
  int? variant_id;
  String? variant_slug;
  String? variant_name;
  bool? continue_application;
  int? popularity_index;
  List<dynamic> offers = [];
  int? vehicle_type;
  bool? test_ride_available;
  bool? home_deleivery_available;
  double? on_road_price;
  bool? offer_exists;
  String? vehicle_type_slug;
  String? make_uuid;
  String? model_uuid;
  String? variant_uuid;
  String? city_uuid;

  BikeModel(
      this.id,
      this.displayname,
      this.image,
      this.rating,
      this.cc,
      this.mileage,
      this.ex_showroom_price,
      this.minimum_omi,
      this.city_id,
      this.city_name,
      this.make_id,
      this.make_slug,
      this.make_name,
      this.model_id,
      this.model_slug,
      this.model_name,
      this.variant_id,
      this.variant_slug,
      this.variant_name,
      this.continue_application,
      this.popularity_index,
      this.offers,
      this.vehicle_type,
      this.test_ride_available,
      this.home_deleivery_available,
      this.on_road_price,
      this.offer_exists,
      this.vehicle_type_slug,
      this.make_uuid,
      this.model_uuid,
      this.variant_uuid,
      this.city_uuid);
}

class BikeItems with ChangeNotifier {
  List<BikeModel> _bikes = [];
  List<BikeModel> get bikelist {
    return [..._bikes];
  }

  dynamic response;
  Future<void> getbikedata() async {
    final url = Uri.parse(
        "https://devapi.otocapital.in/commerce/mobile_order/mmv/?city_slug=bangalore&type=bikes");
    final response = await http.get(url);
    List<BikeModel> loadedbikes = [];
    final result = json.decode(response.body) as Map<String, dynamic>;

    for (int i = 0; i < result["results"].length; i++) {
      _bikes.add(BikeModel(
          result["results"][i]["id"],
          result["results"][i]["display_name"],
          result["results"][i]["image"],
          result["results"][i]["rating"],
          result["results"][i]["cc"],
          result["results"][i]["mileage"],
          result["results"][i]["ex_showroom_price"],
          result["results"][i]["minimum_omi"],
          result["results"][i]["city_id"],
          result["results"][i]["city_name"],
          result["results"][i]["make_id"],
          result["results"][i]["make_slug"],
          result["results"][i]["make_name"],
          result["results"][i]["model_id"],
          result["results"][i]["model_slug"],
          result["results"][i]["model_name"],
          result["results"][i]["variant_id"],
          result["results"][i]["variant_slug"],
          result["results"][i]["variant_name"],
          result["results"][i]["continue_application"],
          result["results"][i]["popularity_index"],
          result["results"][i]["offers"],
          result["results"][i]["vehicle_type"],
          result["results"][i]["test_ride_available"],
          result["results"][i]["home_delivery_available"],
          result["results"][i]["on_road_price"],
          result["results"][i]["offer_exists"],
          result["results"][i]["vehicle_type_slug"],
          result["results"][i]["make_uuid"],
          result["results"][i]["model_uuid"],
          result["results"][i]["variant_uuid"],
          result["results"][i]["city_uuid"]));
    }

    return;
  }
}
