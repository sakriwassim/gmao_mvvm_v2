import '../models_counters/counter_model.dart';

class OneCounterViewModel {
  CounterModel? counterModel;
  OneCounterViewModel({this.counterModel});

  get id => counterModel?.id;
  get description => counterModel?.description;
  get code => counterModel?.code;
  get designation => counterModel?.designation;

  get equipmentDesignation => counterModel?.equipmentDesignation;
  get equipmentLocalization => counterModel?.equipmentLocalization;
}
