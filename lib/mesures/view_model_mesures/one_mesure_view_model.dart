import '../models_mesures/mesure_model.dart';

class OneMesureViewModel {
  MesureModel? mesureModel;
  OneMesureViewModel({this.mesureModel});

  get counterId => mesureModel?.counterId;
  get counterCode => mesureModel?.counterCode;
  get counterUnitMeasureId => mesureModel?.counterUnitMeasureId;
  get counterUnitMeasureCode => mesureModel?.counterUnitMeasureCode;
  get counterUnitMeasureDesignation => mesureModel?.counterUnitMeasureDesignation;
  get unitMeasureFullDesignation => mesureModel?.unitMeasureFullDesignation;
  get counterMaxValue => mesureModel?.counterMaxValue;
  get dateMeasure => mesureModel?.dateMeasure;
  get measure => mesureModel?.measure;
  get consumption => mesureModel?.consumption;
  get comments => mesureModel?.comments;
  get type => mesureModel?.type;
  get employeeId => mesureModel?.employeeId;
 get employeeSerialNumber => mesureModel?.employeeSerialNumber;
  get employeeFullName => mesureModel?.employeeFullName;
  get employeeFullDesignation => mesureModel?.employeeFullDesignation;
 get employeeIsEnabled => mesureModel?.employeeIsEnabled;
  get supplierId => mesureModel?.supplierId;
  get supplierCode => mesureModel?.supplierCode;
  get supplierDesignation => mesureModel?.supplierDesignation;
 get supplierFullDesignation => mesureModel?.supplierFullDesignation;
  get relieverName => mesureModel?.relieverName;
 get filePath => mesureModel?.filePath;
 get createdDate => mesureModel?.createdDate;
  get createdBy => mesureModel?.createdBy;
 get updatedDate => mesureModel?.updatedDate;
  get updatedBy => mesureModel?.updatedBy;
  get crudFrom => mesureModel?.crudFrom;
  get id => mesureModel?.id;
 get currentUserId => mesureModel?.currentUserId;
get currentEmployeeId => mesureModel?.currentEmployeeId;
 get isSystem => mesureModel?.isSystem;
 get crud => mesureModel?.crud;

}




