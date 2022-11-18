import '../counters_repositories/counter_repository.dart';
import '../models_counters/add_counter_model.dart';
import '../models_counters/counter_model.dart';

class CountersViewModel {
  String title = "Counter Page ";

  CountersRepository? countersRepository;
  CountersViewModel({this.countersRepository});

  Future<List<CounterModel>> FetchAllCounters() async {
    List<CounterModel> list = await countersRepository!.getAllCounters();
    return list;
  }

  Future<CounterModel> GetCounterByID(String id) async {
    var counterModel = await countersRepository!.getCounterByID(id);
    return counterModel;
  }

  Future<bool> UpdateCounterByID(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id, int indextabmesure) async {
    var counter =
        await countersRepository!.updateCounterByID( dateMesurefield,  Mesurefield,
       DescriptionField,  id,  indextabmesure);
    return true;
  }
}
