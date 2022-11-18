import '../models_counters/add_counter_model.dart';
import '../models_counters/counter_model.dart';
import 'counter_repository.dart';

class CountersLocal extends CountersRepository {
  @override
  Future<List<CounterModel>> getAllCounters() {
    throw UnimplementedError();
  }

  @override
  Future<CounterModel> getCounterByID(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCounterByID(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id, int indextabmesure) {
    // TODO: implement updateCounterByID
    throw UnimplementedError();
  }
}
