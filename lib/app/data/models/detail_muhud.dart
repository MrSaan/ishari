// To parse this JSON data, do
//
//     final detailMuhud = detailMuhudFromJson(jsonString);

import 'dart:convert';

DetailMuhud detailMuhudFromJson(String str) => DetailMuhud.fromJson(json.decode(str));

String detailMuhudToJson(DetailMuhud data) => json.encode(data.toJson());

class DetailMuhud {
  DetailMuhud({
    this.number,
    this.numberOfDiwanHadrah,
    this.numberOfMaulidSyarofulAnam,
    this.name,
    this.diwanHadrah,
    this.syarofulAnam,
    this.muhud,
  });

  int? number;
  int? numberOfDiwanHadrah;
  int? numberOfMaulidSyarofulAnam;
  Name? name;
  List<DiwanHadrah>? diwanHadrah;
  List<SyarofulAnam>? syarofulAnam;
  List<Muhud>? muhud;

  factory DetailMuhud.fromJson(Map<String, dynamic>? json) => DetailMuhud(
        number: json?["number"],
        numberOfDiwanHadrah: json?["numberOfDiwanHadrah"],
        numberOfMaulidSyarofulAnam: json?["numberOfMaulidSyarofulAnam"],
        name: Name.fromJson(json?["name"]),
        diwanHadrah: json?["diwanHadrah"] == null ? null : List<DiwanHadrah>.from(json!["diwanHadrah"].map((x) => DiwanHadrah.fromJson(x))),
        syarofulAnam: json?["syarofulAnam"] == null ? null : List<SyarofulAnam>.from(json!["syarofulAnam"].map((x) => SyarofulAnam.fromJson(x))),
        muhud: json?["muhud"] == null ? null : List<Muhud>.from(json?["muhud"].map((x) => Muhud.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "numberOfDiwanHadrah": numberOfDiwanHadrah,
        "numberOfMaulidSyarofulAnam": numberOfMaulidSyarofulAnam,
        "name": name?.toJson(),
        "diwanHadrah": diwanHadrah == null ? null : List<dynamic>.from(diwanHadrah!.map((x) => x.toJson())),
        "syarofulAnam": syarofulAnam == null ? null : List<dynamic>.from(syarofulAnam!.map((x) => x.toJson())),
        "muhud": muhud == null ? null : List<dynamic>.from(muhud!.map((x) => x.toJson())),
      };
}

class DiwanHadrah {
  DiwanHadrah({
    this.number,
    this.text,
    this.translation,
    this.audio,
  });

  DiwanHadrahNumber? number;
  Text? text;
  Translation? translation;
  Audio? audio;

  factory DiwanHadrah.fromJson(Map<String, dynamic>? json) => DiwanHadrah(
        number: DiwanHadrahNumber.fromJson(json?["number"]),
        text: Text.fromJson(json?["text"]),
        translation: Translation.fromJson(json?["translation"]),
        audio: Audio.fromJson(json?["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
      };
}

class Audio {
  Audio({
    this.primary,
  });

  String? primary;

  factory Audio.fromJson(Map<String, dynamic>? json) => Audio(
        primary: json?["primary"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
      };
}

class DiwanHadrahNumber {
  DiwanHadrahNumber({
    this.inDiwan,
    this.inMuhud,
  });

  int? inDiwan;
  int? inMuhud;

  factory DiwanHadrahNumber.fromJson(Map<String, dynamic>? json) => DiwanHadrahNumber(
        inDiwan: json?["inDiwan"],
        inMuhud: json?["inMuhud"],
      );

  Map<String, dynamic> toJson() => {
        "inDiwan": inDiwan,
        "inMuhud": inMuhud,
      };
}

class Text {
  Text({
    this.arab,
    this.transliteration,
  });

  String? arab;
  String? transliteration;

  factory Text.fromJson(Map<String, dynamic>? json) => Text(
        arab: json?["arab"],
        transliteration: json?["transliteration"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration,
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

class Muhud {
  Muhud({
    this.number,
    this.text,
    this.translation,
    this.audio,
    this.kondisiAudio = "stop",
  });

  String kondisiAudio;
  MuhudNumber? number;
  Text? text;
  Translation? translation;
  Audio? audio;

  factory Muhud.fromJson(Map<String, dynamic>? json) => Muhud(
        number: MuhudNumber.fromJson(json?["number"]),
        text: Text.fromJson(json?["text"]),
        translation: Translation.fromJson(json?["translation"]),
        audio: Audio.fromJson(json?["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
        "kondisiAudio": kondisiAudio,
      };
}

class MuhudNumber {
  MuhudNumber({
    this.inMuhud,
  });

  int? inMuhud;

  factory MuhudNumber.fromJson(Map<String, dynamic>? json) => MuhudNumber(
        inMuhud: json?["inMuhud"],
      );

  Map<String, dynamic> toJson() => {
        "inMuhud": inMuhud,
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

class Transliteration {
  Transliteration({
    this.arab,
    this.id,
  });

  String? arab;
  String? id;

  factory Transliteration.fromJson(Map<String, dynamic>? json) => Transliteration(
        arab: json?["arab"],
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "id": id,
      };
}

class SyarofulAnam {
  SyarofulAnam({
    this.number,
    this.text,
    this.translation,
    this.audio,
  });

  SyarofulAnamNumber? number;
  Text? text;
  Translation? translation;
  Audio? audio;

  factory SyarofulAnam.fromJson(Map<String, dynamic>? json) => SyarofulAnam(
        number: SyarofulAnamNumber.fromJson(json?["number"]),
        text: Text.fromJson(json?["text"]),
        translation: Translation.fromJson(json?["translation"]),
        audio: Audio.fromJson(json?["audio"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number?.toJson(),
        "text": text?.toJson(),
        "translation": translation?.toJson(),
        "audio": audio?.toJson(),
      };
}

class SyarofulAnamNumber {
  SyarofulAnamNumber({
    this.inSyaroful,
    this.inMuhud,
  });

  int? inSyaroful;
  int? inMuhud;

  factory SyarofulAnamNumber.fromJson(Map<String, dynamic>? json) => SyarofulAnamNumber(
        inSyaroful: json?["inSyaroful"],
        inMuhud: json?["inMuhud"],
      );

  Map<String, dynamic> toJson() => {
        "inSyaroful": inSyaroful,
        "inMuhud": inMuhud,
      };
}
