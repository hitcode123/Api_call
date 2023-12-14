import 'package:flutter/material.dart';
import 'package:internship_porject_api_call/Repository.dart';

class DetailScreen extends StatefulWidget {
  BikeModel Bikemodel;
  DetailScreen({required this.Bikemodel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                widget.Bikemodel.image.toString(),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              widget.Bikemodel.model_name.toString(),
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Name + id
          Text("Bike Model id" + " " + widget.Bikemodel.id.toString()),
          Text("Bike Model  rating" + " " + widget.Bikemodel.rating.toString()),
          // Text("cc :" + ""),
          // Text("mileage" + " "),
          Text("ex_showroom_price" +
              " " +
              widget.Bikemodel.ex_showroom_price.toString()),
          Text("minimum_omi" + " " + widget.Bikemodel.minimum_omi.toString()),
          Text("city_id" + "  " + widget.Bikemodel.city_name.toString()),
          Text("City Name" + " " + widget.Bikemodel.city_name.toString()),
          Text("make_id" + "  " + widget.Bikemodel.make_id.toString()),
          Text("make_slug" + " " + widget.Bikemodel.make_slug.toString()),
          Text("make_name" + " " + widget.Bikemodel.make_name.toString()),
          Text("model_id" + " " + widget.Bikemodel.model_id.toString()),
          Text("model_slug" + " " + widget.Bikemodel.model_slug.toString()),
          Text("model_name" + " " + widget.Bikemodel.model_name.toString()),
          Text("variant id" + "  " + widget.Bikemodel.variant_id.toString()),
          Text(
              "variant Slug" + "  " + widget.Bikemodel.variant_slug.toString()),
          Text(
              "variant name" + "  " + widget.Bikemodel.variant_name.toString()),
          Text("Continue Application" +
              " " +
              widget.Bikemodel.continue_application.toString()),
          Text("Popularity Index" +
              " " +
              widget.Bikemodel.popularity_index.toString()),
          Text(
              "vehicle type" + "  " + widget.Bikemodel.vehicle_type.toString()),
          Text("test ride available" +
              " " +
              widget.Bikemodel.test_ride_available.toString()),
          Text("home_delivery_available" +
              " " +
              widget.Bikemodel.home_deleivery_available.toString()),
          Text("on_road_price " +
              " " +
              widget.Bikemodel.on_road_price.toString()),
          Text("offer_exists" + " " + widget.Bikemodel.offer_exists.toString()),
          Text("vehicle type slug" +
              "  " +
              widget.Bikemodel.vehicle_type_slug.toString()),
          Text("make_uuid" + " " + widget.Bikemodel.make_uuid.toString()),
          Text("model_uuid" + " " + widget.Bikemodel.model_uuid.toString()),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
