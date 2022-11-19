class SiteModel {
  String? id;

  SiteModel({
    required this.id,
  });

  factory SiteModel.toObject(Map<String, dynamic> json) => SiteModel(
        id: json['id'],
      );
}

// ignore: camel_case_types
class authentificationModel {
  // ignore: non_constant_identifier_names
  String? access_token;

  authentificationModel({
    // ignore: non_constant_identifier_names
    required this.access_token,
  });

  factory authentificationModel.toObject(Map<String, dynamic> json) =>
      authentificationModel(
        access_token: json['access_token'],
      );
}
