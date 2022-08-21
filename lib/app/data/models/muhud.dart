// To parse this JSON data, do
import 'dart:convert';

Muhud muhudFromJson(String str) => Muhud.fromJson(json.decode(str));

String muhudToJson(Muhud data) => json.encode(data.toJson());

class Muhud {
  Muhud({
    this.number,
    this.numberOfVerses,
    this.name,
  });

  int? number;
  int? numberOfVerses;
  Name? name;

  factory Muhud.fromJson(Map<String, dynamic>? json) => Muhud(
        number: json?["number"],
        numberOfVerses: json?["numberOfVerses"],
        name: Name.fromJson(json?["name"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
      };
}

class Name {
  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  String? short;
  String? long;
  Transliteration? transliteration;
  Translation? translation;

  factory Name.fromJson(Map<String, dynamic>? json) => Name(
        short: json?["short"],
        long: json?["long"],
        transliteration: Transliteration.fromJson(json?["transliteration"]),
        translation: Translation.fromJson(json?["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
      };
}

class Translation {
  Translation({
    this.id,
  });

  String? id;

  factory Translation.fromJson(Map<String, dynamic>? json) => Translation(
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Transliteration {
  Transliteration({
    this.arab,
    this.id,
  });

  String? arab;
  String? id;

  factory Transliteration.fromJson(Map<String, dynamic>? json) =>
      Transliteration(
        arab: json?["arab"],
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "id": id,
      };
}
