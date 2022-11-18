class CounterModel {
  String? code;
  String? designation;
  String? fullDesignation;
  String? description;
  String? equipmentId;
  String? equipmentCode;
  String? equipmentDesignation;
  String? equipmentFullDesignation;
  String? equipmentLocalization;
  int? equipmentNature;
  String? equipmentInternalBarcode;
  String? equipmentQrCode;
  String? unitMeasureId;
  String? unitMeasureCode;
  String? unitMeasureDesignation;
  String? unitMeasureFullDesignation;
  double? maxValue;
  double? alertValue;
  double? nominalValue;
  int? type;
  bool? isEnabled;
  String? disabledDate;
  String? qrCode;
  double? frequency;
  String? latestMeasureDate;
  String? nextMeasureDate;
  double? latestMeasureValue;
  double? latestConsumptionValue;
  List<Measures>? measures;
  List<CounterTeams>? counterTeams;
  String? lastDateMeasure;
  double? lastMeasure;
  String? equipmentNatureStr;
  String? siteId;
  String? siteName;
  String? companyId;
  bool? isShared;
  String? sharedWith;
  bool? isBookmark;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  int? crudFrom;
  String? id;
  String? currentUserId;
  String? currentEmployeeId;
  bool? isSystem;
  int? crud;

  CounterModel(
      {this.code,
      this.designation,
      this.fullDesignation,
      this.description,
      this.equipmentId,
      this.equipmentCode,
      this.equipmentDesignation,
      this.equipmentFullDesignation,
      this.equipmentLocalization,
      this.equipmentNature,
      this.equipmentInternalBarcode,
      this.equipmentQrCode,
      this.unitMeasureId,
      this.unitMeasureCode,
      this.unitMeasureDesignation,
      this.unitMeasureFullDesignation,
      this.maxValue,
      this.alertValue,
      this.nominalValue,
      this.type,
      this.isEnabled,
      this.disabledDate,
      this.qrCode,
      this.frequency,
      this.latestMeasureDate,
      this.nextMeasureDate,
      this.latestMeasureValue,
      this.latestConsumptionValue,
      this.measures,
      this.lastDateMeasure,
      this.lastMeasure,
      this.equipmentNatureStr,
      this.siteId,
      this.siteName,
      this.companyId,
      this.isShared,
      this.sharedWith,
      this.isBookmark,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.crudFrom,
      this.id,
      this.currentUserId,
      this.currentEmployeeId,
      this.isSystem,
      this.crud});

  CounterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    designation = json['designation'];
    fullDesignation = json['fullDesignation'];
    description = json['description'];
    equipmentId = json['equipmentId'];
    equipmentCode = json['equipmentCode'];
    equipmentDesignation = json['equipmentDesignation'];
    equipmentFullDesignation = json['equipmentFullDesignation'];
    equipmentLocalization = json['equipmentLocalization'];
    equipmentNature = json['equipmentNature'];
    equipmentInternalBarcode = json['equipmentInternalBarcode'];
    equipmentQrCode = json['equipmentQrCode'];
    unitMeasureId = json['unitMeasureId'];
    unitMeasureCode = json['unitMeasureCode'];
    unitMeasureDesignation = json['unitMeasureDesignation'];
    unitMeasureFullDesignation = json['unitMeasureFullDesignation'];
    maxValue = json['maxValue'];
    alertValue = json['alertValue'];
    nominalValue = json['nominalValue'];
    type = json['type'];
    isEnabled = json['isEnabled'];
    disabledDate = json['disabledDate'];
    qrCode = json['qrCode'];
    frequency = json['frequency'];
    latestMeasureDate = json['latestMeasureDate'];
    nextMeasureDate = json['nextMeasureDate'];
    latestMeasureValue = json['latestMeasureValue'];
    latestConsumptionValue = json['latestConsumptionValue'];
    if (json['measures'] != null) {
      measures = <Measures>[];
      json['measures'].forEach((v) {
        measures!.add(new Measures.fromJson(v));
      });
    }
    lastDateMeasure = json['lastDateMeasure'];
    lastMeasure = json['lastMeasure'];
    equipmentNatureStr = json['equipmentNatureStr'];
    siteId = json['siteId'];
    siteName = json['siteName'];
    companyId = json['companyId'];
    isShared = json['isShared'];
    sharedWith = json['sharedWith'];
    isBookmark = json['isBookmark'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
    crudFrom = json['crudFrom'];
    id = json['id'];
    currentUserId = json['currentUserId'];
    currentEmployeeId = json['currentEmployeeId'];
    isSystem = json['isSystem'];
    crud = json['crud'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['designation'] = this.designation;
    data['fullDesignation'] = this.fullDesignation;
    data['description'] = this.description;
    data['equipmentId'] = this.equipmentId;
    data['equipmentCode'] = this.equipmentCode;
    data['equipmentDesignation'] = this.equipmentDesignation;
    data['equipmentFullDesignation'] = this.equipmentFullDesignation;
    data['equipmentLocalization'] = this.equipmentLocalization;
    data['equipmentNature'] = this.equipmentNature;
    data['equipmentInternalBarcode'] = this.equipmentInternalBarcode;
    data['equipmentQrCode'] = this.equipmentQrCode;
    data['unitMeasureId'] = this.unitMeasureId;
    data['unitMeasureCode'] = this.unitMeasureCode;
    data['unitMeasureDesignation'] = this.unitMeasureDesignation;
    data['unitMeasureFullDesignation'] = this.unitMeasureFullDesignation;
    data['maxValue'] = this.maxValue;
    data['alertValue'] = this.alertValue;
    data['nominalValue'] = this.nominalValue;
    data['type'] = this.type;
    data['isEnabled'] = this.isEnabled;
    data['disabledDate'] = this.disabledDate;
    data['qrCode'] = this.qrCode;
    data['frequency'] = this.frequency;
    data['latestMeasureDate'] = this.latestMeasureDate;
    data['nextMeasureDate'] = this.nextMeasureDate;
    data['latestMeasureValue'] = this.latestMeasureValue;
    data['latestConsumptionValue'] = this.latestConsumptionValue;
    if (this.measures != null) {
      data['measures'] = this.measures!.map((v) => v.toJson()).toList();
    }
    data['lastDateMeasure'] = this.lastDateMeasure;
    data['lastMeasure'] = this.lastMeasure;
    data['equipmentNatureStr'] = this.equipmentNatureStr;
    data['siteId'] = this.siteId;
    data['siteName'] = this.siteName;
    data['companyId'] = this.companyId;
    data['isShared'] = this.isShared;
    data['sharedWith'] = this.sharedWith;
    data['isBookmark'] = this.isBookmark;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    data['crudFrom'] = this.crudFrom;
    data['id'] = this.id;
    data['currentUserId'] = this.currentUserId;
    data['currentEmployeeId'] = this.currentEmployeeId;
    data['isSystem'] = this.isSystem;
    data['crud'] = this.crud;
    return data;
  }
}

class CounterTeams {
  String? counterId;
  bool? roleIsSupervisor;
  bool? roleIsMember;
  bool? roleIsInformed;
  String? roleComments;
  String? legacyId;
  int? typeLegacy;
  String? employeeId;
  String? employeeSerialNumber;
  String? employeeFullName;
  String? employeeEmail;
  bool? employeeIsEnabled;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  int? crudFrom;
  String? id;
  String? currentUserId;
  String? currentEmployeeId;
  bool? isSystem;
  int? crud;

  CounterTeams(
      {this.counterId,
      this.roleIsSupervisor,
      this.roleIsMember,
      this.roleIsInformed,
      this.roleComments,
      this.legacyId,
      this.typeLegacy,
      this.employeeId,
      this.employeeSerialNumber,
      this.employeeFullName,
      this.employeeEmail,
      this.employeeIsEnabled,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.crudFrom,
      this.id,
      this.currentUserId,
      this.currentEmployeeId,
      this.isSystem,
      this.crud});

  CounterTeams.fromJson(Map<String, dynamic> json) {
    counterId = json['counterId'];
    roleIsSupervisor = json['roleIsSupervisor'];
    roleIsMember = json['roleIsMember'];
    roleIsInformed = json['roleIsInformed'];
    roleComments = json['roleComments'];
    legacyId = json['legacyId'];
    typeLegacy = json['typeLegacy'];
    employeeId = json['employeeId'];
    employeeSerialNumber = json['employeeSerialNumber'];
    employeeFullName = json['employeeFullName'];
    employeeEmail = json['employeeEmail'];
    employeeIsEnabled = json['employeeIsEnabled'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
    crudFrom = json['crudFrom'];
    id = json['id'];
    currentUserId = json['currentUserId'];
    currentEmployeeId = json['currentEmployeeId'];
    isSystem = json['isSystem'];
    crud = json['crud'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counterId'] = this.counterId;
    data['roleIsSupervisor'] = this.roleIsSupervisor;
    data['roleIsMember'] = this.roleIsMember;
    data['roleIsInformed'] = this.roleIsInformed;
    data['roleComments'] = this.roleComments;
    data['legacyId'] = this.legacyId;
    data['typeLegacy'] = this.typeLegacy;
    data['employeeId'] = this.employeeId;
    data['employeeSerialNumber'] = this.employeeSerialNumber;
    data['employeeFullName'] = this.employeeFullName;
    data['employeeEmail'] = this.employeeEmail;
    data['employeeIsEnabled'] = this.employeeIsEnabled;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    data['crudFrom'] = this.crudFrom;
    data['id'] = this.id;
    data['currentUserId'] = this.currentUserId;
    data['currentEmployeeId'] = this.currentEmployeeId;
    data['isSystem'] = this.isSystem;
    data['crud'] = this.crud;
    return data;
  }
}

class Measures {
  String? counterId;
  String? counterCode;
  String? counterUnitMeasureId;
  String? counterUnitMeasureCode;
  String? counterUnitMeasureDesignation;
  String? unitMeasureFullDesignation;
  double? counterMaxValue;
  String? dateMeasure;
  double? measure;
  double? consumption;
  String? comments;
  int? type;
  String? employeeId;
  String? employeeSerialNumber;
  String? employeeFullName;
  String? employeeFullDesignation;
  bool? employeeIsEnabled;
  String? supplierId;
  String? supplierCode;
  String? supplierDesignation;
  String? supplierFullDesignation;
  String? relieverName;
  String? filePath;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  int? crudFrom;
  String? id;
  String? currentUserId;
  String? currentEmployeeId;
  bool? isSystem;
  int? crud;

  Measures(
      {this.counterId,
      this.counterCode,
      this.counterUnitMeasureId,
      this.counterUnitMeasureCode,
      this.counterUnitMeasureDesignation,
      this.unitMeasureFullDesignation,
      this.counterMaxValue,
      this.dateMeasure,
      this.measure,
      this.consumption,
      this.comments,
      this.type,
      this.employeeId,
      this.employeeSerialNumber,
      this.employeeFullName,
      this.employeeFullDesignation,
      this.employeeIsEnabled,
      this.supplierId,
      this.supplierCode,
      this.supplierDesignation,
      this.supplierFullDesignation,
      this.relieverName,
      this.filePath,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.crudFrom,
      this.id,
      this.currentUserId,
      this.currentEmployeeId,
      this.isSystem,
      this.crud});

  Measures.fromJson(Map<String, dynamic> json) {
    counterId = json['counterId'];
    counterCode = json['counterCode'];
    counterUnitMeasureId = json['counterUnitMeasureId'];
    counterUnitMeasureCode = json['counterUnitMeasureCode'];
    counterUnitMeasureDesignation = json['counterUnitMeasureDesignation'];
    unitMeasureFullDesignation = json['unitMeasureFullDesignation'];
    counterMaxValue = json['counterMaxValue'];
    dateMeasure = json['dateMeasure'];
    measure = json['measure'];
    consumption = json['consumption'];
    comments = json['comments'];
    type = json['type'];
    employeeId = json['employeeId'];
    employeeSerialNumber = json['employeeSerialNumber'];
    employeeFullName = json['employeeFullName'];
    employeeFullDesignation = json['employeeFullDesignation'];
    employeeIsEnabled = json['employeeIsEnabled'];
    supplierId = json['supplierId'];
    supplierCode = json['supplierCode'];
    supplierDesignation = json['supplierDesignation'];
    supplierFullDesignation = json['supplierFullDesignation'];
    relieverName = json['relieverName'];
    filePath = json['filePath'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    updatedDate = json['updatedDate'];
    updatedBy = json['updatedBy'];
    crudFrom = json['crudFrom'];
    id = json['id'];
    currentUserId = json['currentUserId'];
    currentEmployeeId = json['currentEmployeeId'];
    isSystem = json['isSystem'];
    crud = json['crud'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counterId'] = this.counterId;
    data['counterCode'] = this.counterCode;
    data['counterUnitMeasureId'] = this.counterUnitMeasureId;
    data['counterUnitMeasureCode'] = this.counterUnitMeasureCode;
    data['counterUnitMeasureDesignation'] = this.counterUnitMeasureDesignation;
    data['unitMeasureFullDesignation'] = this.unitMeasureFullDesignation;
    data['counterMaxValue'] = this.counterMaxValue;
    data['dateMeasure'] = this.dateMeasure;
    data['measure'] = this.measure;
    data['consumption'] = this.consumption;
    data['comments'] = this.comments;
    data['type'] = this.type;
    data['employeeId'] = this.employeeId;
    data['employeeSerialNumber'] = this.employeeSerialNumber;
    data['employeeFullName'] = this.employeeFullName;
    data['employeeFullDesignation'] = this.employeeFullDesignation;
    data['employeeIsEnabled'] = this.employeeIsEnabled;
    data['supplierId'] = this.supplierId;
    data['supplierCode'] = this.supplierCode;
    data['supplierDesignation'] = this.supplierDesignation;
    data['supplierFullDesignation'] = this.supplierFullDesignation;
    data['relieverName'] = this.relieverName;
    data['filePath'] = this.filePath;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['updatedDate'] = this.updatedDate;
    data['updatedBy'] = this.updatedBy;
    data['crudFrom'] = this.crudFrom;
    data['id'] = this.id;
    data['currentUserId'] = this.currentUserId;
    data['currentEmployeeId'] = this.currentEmployeeId;
    data['isSystem'] = this.isSystem;
    data['crud'] = this.crud;
    return data;
  }
}
