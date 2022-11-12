import '../counters_repositories/counter_repository.dart';
import '../models_counters/counter_model.dart';
import 'one_counter_view_model.dart';

class CountersViewModel {
  String title = "Counter Page ";

  CountersRepository? countersRepository;
  CountersViewModel({this.countersRepository});

  Future<List<OneCounterViewModel>> FetchAllCounters() async {
    List<CounterModel> list = await countersRepository!.getAllCounters();
    return list
        .map((listCounter) => OneCounterViewModel(counterModel: listCounter))
        .toList();
  }

  Future<OneCounterViewModel> GetCounterByID(int id) async {
    var counterModel = await countersRepository!.getCounterByID(id);
    return OneCounterViewModel(counterModel: counterModel);
  }

  // Future<bool> UpdateCounterByID(CounterModel counterModel) async {
  //   var counter = await countersRepository!.updateCounterByID(counterModel);
  //   return true;
  // }

}
