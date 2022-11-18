class AddCounterModel {
  String code;
  String designation;
  String fullDesignation;
  String? description;
  String equipmentId;
  String equipmentCode;
  String equipmentDesignation;
  String equipmentFullDesignation;
  String equipmentLocalization;
  int equipmentNature;
  String? equipmentInternalBarcode;
  String unitMeasureId;
  String unitMeasureCode;
  String unitMeasureDesignation;
  String unitMeasureFullDesignation;
  double maxValue;
  double alertValue;
  int type;
  bool isEnabled;
  String? disabledDate;
  List<Mesure> measures;
  List<dynamic>? counterTeams;
  String? lastDateMeasure;
  double? lastMeasure;
  String equipmentNatureStr;
  String siteId;
  String? siteName;
  String companyId;
  String id;
  String createdDate;
  String createdBy;
  String updatedDate;
  String updatedBy;
  int crudFrom;
  String currentUserId;
  String currentEmployeeId;
  bool isSystem;
  int crud;

  AddCounterModel({
    required this.code,
    required this.designation,
    required this.fullDesignation,
    required this.description,
    required this.equipmentId,
    required this.equipmentCode,
    required this.equipmentDesignation,
    required this.equipmentFullDesignation,
    required this.equipmentLocalization,
    required this.equipmentNature,
    required this.equipmentInternalBarcode,
    required this.unitMeasureId,
    required this.unitMeasureCode,
    required this.unitMeasureDesignation,
    required this.unitMeasureFullDesignation,
    required this.maxValue,
    required this.alertValue,
    required this.type,
    required this.isEnabled,
    required this.disabledDate,
    required this.measures,
    required this.counterTeams,
    required this.lastDateMeasure,
    required this.lastMeasure,
    required this.equipmentNatureStr,
    required this.siteId,
    required this.siteName,
    required this.companyId,
    required this.id,
    required this.createdDate,
    required this.createdBy,
    required this.updatedDate,
    required this.updatedBy,
    required this.crudFrom,
    required this.currentUserId,
    required this.currentEmployeeId,
    required this.isSystem,
    required this.crud,
  });

  factory AddCounterModel.toObject(Map<String, dynamic> json) =>
      AddCounterModel(
        code: json['code'],
        designation: json['designation'],
        fullDesignation: json['fullDesignation'],
        description: json['description'],
        equipmentId: json['equipmentId'],
        equipmentCode: json['equipmentCode'],
        equipmentDesignation: json['equipmentDesignation'],
        equipmentFullDesignation: json['equipmentFullDesignation'],
        equipmentLocalization: json['equipmentLocalization'],
        equipmentNature: json['equipmentNature'],
        equipmentInternalBarcode: json['equipmentInternalBarcode'],
        unitMeasureId: json['unitMeasureId'],
        unitMeasureCode: json['unitMeasureCode'],
        unitMeasureDesignation: json['unitMeasureDesignation'],
        unitMeasureFullDesignation: json['unitMeasureFullDesignation'],
        maxValue: json['maxValue'],
        alertValue: json['alertValue'],
        type: json['type'],
        isEnabled: json['isEnabled'],
        disabledDate: json['disabledDate'],
        measures:
            List<Mesure>.from(json['measures'].map((m) => Mesure.fromJson(m))),
        counterTeams: json['counterTeams'],
        lastDateMeasure: json['lastDateMeasure'],
        lastMeasure: json['lastMeasure'],
        equipmentNatureStr: json['equipmentNatureStr'],
        siteId: json['siteId'],
        siteName: json['siteName'],
        companyId: json['companyId'],
        id: json['id'],
        createdDate: json['createdDate'],
        createdBy: json['createdBy'],
        updatedDate: json['updatedDate'],
        updatedBy: json['updatedBy'],
        crudFrom: json['crudFrom'],
        currentUserId: json['currentUserId'],
        currentEmployeeId: json['currentEmployeeId'],
        isSystem: json['isSystem'],
        crud: json['crud'],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "designation": designation,
        "measures": List<Mesure>.from(measures.map((e) => e.toJson()))
      };
}

class Mesure {
  String counterId;
  String counterCode;
  String counterUnitMeasureId;
  String counterUnitMeasureCode;
  String counterUnitMeasureDesignation;
  String unitMeasureFullDesignation;
  double counterMaxValue;
  String dateMeasure;
  double measure;
  String? comments;
  String id;
  String createdDate;
  String createdBy;
  String? updatedDate;
  String? updatedBy;
  int crudFrom;
  String currentUserId;
  String currentEmployeeId;
  bool isSystem;
  int crud;

  Mesure(
      {required this.counterId,
      required this.counterCode,
      required this.counterUnitMeasureId,
      required this.counterUnitMeasureCode,
      required this.counterUnitMeasureDesignation,
      required this.unitMeasureFullDesignation,
      required this.counterMaxValue,
      required this.dateMeasure,
      required this.measure,
      required this.comments,
      required this.id,
      required this.createdDate,
      required this.createdBy,
      required this.updatedDate,
      required this.updatedBy,
      required this.crudFrom,
      required this.currentUserId,
      required this.currentEmployeeId,
      required this.isSystem,
      required this.crud});
  factory Mesure.fromJson(Map<String, dynamic> json) => Mesure(
      counterId: json['counterId'],
      counterCode: json['counterCode'],
      counterUnitMeasureId: json['counterUnitMeasureId'],
      counterUnitMeasureCode: json['counterUnitMeasureCode'],
      counterUnitMeasureDesignation: json['counterUnitMeasureDesignation'],
      unitMeasureFullDesignation: json['unitMeasureFullDesignation'],
      counterMaxValue: json['counterMaxValue'],
      dateMeasure: json['dateMeasure'],
      measure: json['measure'],
      comments: json['comments'],
      id: json['id'],
      createdDate: json['createdDate'],
      createdBy: json['createdBy'],
      updatedDate: json['updatedDate'],
      updatedBy: json['updatedBy'],
      crudFrom: json['crudFrom'],
      currentUserId: json['currentUserId'],
      currentEmployeeId: json['currentEmployeeId'],
      isSystem: json['isSystem'],
      crud: json['crud']);

  Map<String, dynamic> toJson() => {
        "measure": measure
        //  , "crud": crud
      };
}
