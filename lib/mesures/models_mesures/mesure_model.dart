class MesureModel {
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

  MesureModel(
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

  MesureModel.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJSON() {
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
