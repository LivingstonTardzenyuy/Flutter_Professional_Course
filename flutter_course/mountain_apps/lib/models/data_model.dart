import 'package:flutter/material.dart';

class DataModel{
  late String name;
  late String img;
  late int price;
  late int people;
  late int stars;
  late String description;
  late String location;

  DataModel({required this.name, required this.img, required this.price, required this.people, required this.stars, required this.description, required this.location});

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(name: json["name"],
        img: json["img"],
        price: json["price"],
        people: json["people"],
        stars: json['stars'],
        description: json['description'],
        location: json["location"]);
  }
}