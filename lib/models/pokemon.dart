import 'dart:convert';
import 'dart:core';

Pokemon pokemonFromJson(String str, String id) =>
    Pokemon.fromJson(json.decode(str), id);

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  String id;
  String name;
  double height;
  double weight;
  String image;

  Pokemon(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.image});

  factory Pokemon.fromJson(Map<String, dynamic> json, String id) {
    return Pokemon(
        id: id,
        name:
            "${json["name"].toString()[0].toUpperCase()}${json["name"].toString().substring(1)}",
        height: double.parse(json["height"].toString()),
        weight: double.parse(json["weight"].toString()),
        image: json["sprites"]["front_default"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "weight": weight,
        "image": image,
      };
}
