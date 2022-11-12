import '../models_counters/counter_model.dart';

abstract class CountersRepository {
  Future<List<CounterModel>> getAllCounters();
  Future<CounterModel> getCounterByID(int id);
  // Future<CounterModel> updateCounterByID(CounterModel counterModel);
  // Future<bool> addCounter(AddCounterModel addCounterModel);
  //Future<bool> deleteCounterByID(int id);
}
