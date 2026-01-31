// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    int id;
    String isim;
    bool erkekMi;
    List<String> sevdigiRenkler;
    List<Adress> adress;

    Person({
        required this.id,
        required this.isim,
        required this.erkekMi,
        required this.sevdigiRenkler,
        required this.adress,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        isim: json["isim"],
        erkekMi: json["erkekMi"],
        sevdigiRenkler: List<String>.from(json["sevdigiRenkler"].map((x) => x)),
        adress: List<Adress>.from(json["adress"].map((x) => Adress.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "isim": isim,
        "erkekMi": erkekMi,
        "sevdigiRenkler": List<dynamic>.from(sevdigiRenkler.map((x) => x)),
        "adress": List<dynamic>.from(adress.map((x) => x.toJson())),
    };
}

class Adress {
    String il;
    String ilce;
    String tur;

    Adress({
        required this.il,
        required this.ilce,
        required this.tur,
    });

    factory Adress.fromJson(Map<String, dynamic> json) => Adress(
        il: json["il"],
        ilce: json["ilce"],
        tur: json["tur"],
    );

    Map<String, dynamic> toJson() => {
        "il": il,
        "ilce": ilce,
        "tur": tur,
    };
}
