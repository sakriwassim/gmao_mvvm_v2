import '../models_counters/add_counter_model.dart';
import '../models_counters/counter_model.dart';

abstract class CountersRepository {
  Future<List<CounterModel>> getAllCounters();
  Future<CounterModel> getCounterByID(String id);
  Future<bool> updateCounterByID(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id, int indextabmesure);
  // Future<bool> addCounter(AddCounterModel addCounterModel);
  //Future<bool> deleteCounterByID(int id);
}
