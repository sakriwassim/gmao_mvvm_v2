

import '../models_counters/counter_model.dart';
import 'counter_repository.dart';

class CountersLocal extends CountersRepository {
  @override
  Future<List<CounterModel>> getAllCounters() {
    throw UnimplementedError();
  }

  @override
  Future<CounterModel> getCounterByID(int id) {
    throw UnimplementedError();
  }
}
