import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel {
  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
    // if (json['data'] != null) {
    //   data = <Data>[];
    //   json['data'].forEach((v) {
    //     data!.add(Data.fromJson(v));
    //   });
    // }
  }

  List<Data>? data;

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }

  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

@JsonSerializable()
class Data {
 final String? color;
 final int? id;
 final String? name;
 final String? pantoneValue;
 final int? year;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);

    // id = json['id'];
    // name = json['name'];
    // year = json['year'];
    // color = json['color'];
    // pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['year'] = year;
  //   data['color'] = color;
  //   data['pantone_value'] = pantoneValue;
  //   return data;
  // }
}
