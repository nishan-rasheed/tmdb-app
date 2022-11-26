// To parse this JSON data, do
//
//     final castModel = castModelFromJson(jsonString);

import 'dart:convert';

List<CastModel> castModelFromJson(String str) => List<CastModel>.from(json.decode(str).map((x) => CastModel.fromJson(x)));

String castModelToJson(List<CastModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CastModel {
    CastModel({
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
    });

    bool? adult;
    int? gender;
    int? id;
    KnownForDepartment? knownForDepartment;
    String? name;
    String? originalName;
    double? popularity;
    String? profilePath;
    int? castId;
    String? character;
    String? creditId;
    int? order;

    factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: knownForDepartmentValues.map[json["known_for_department"]],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartmentValues.reverse[knownForDepartment],
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath == null ? null : profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
    };
}

enum KnownForDepartment { ACTING, WRITING, CREW, VISUAL_EFFECTS, DIRECTING }

final knownForDepartmentValues = EnumValues({
    "Acting": KnownForDepartment.ACTING,
    "Crew": KnownForDepartment.CREW,
    "Directing": KnownForDepartment.DIRECTING,
    "Visual Effects": KnownForDepartment.VISUAL_EFFECTS,
    "Writing": KnownForDepartment.WRITING
});

class EnumValues<T> {
    Map<String, T> map;
   late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
