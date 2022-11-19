import '../mesures_repositories/mesure_repository.dart';
import '../models_mesures/add_mesure_model.dart';
import '../models_mesures/mesure_model.dart';
import 'one_mesure_view_model.dart';

class MesuresViewModel {
  String title = "Mesure Page ";

  MesuresRepository? mesuresRepository;
  MesuresViewModel({this.mesuresRepository});

  Future<List<OneMesureViewModel>> GetMesureByCounter(String id) async {
    List<MesureModel> list = await mesuresRepository!.getMesureByCounter(id);
    print(list);
    return list
        .map((listMesure) => OneMesureViewModel(mesureModel: listMesure))
        .toList();
  }

  // Future<List<OneMesureViewModel>> FetchAllMesures() async {
  //   List<MesureModel> list = await mesuresRepository!.getAllMesures();
  //   return list
  //       .map((listMesure) => OneMesureViewModel(mesureModel: listMesure))
  //       .toList();
  // }

  Future<OneMesureViewModel> GetMesureByID(String id) async {
    var mesureModel = await mesuresRepository!.getMesureByID(id);
    return OneMesureViewModel(mesureModel: mesureModel);
  }

  Future<bool> UpdateMesureByID(MesureModel mesureModel) async {
    var mesure = await mesuresRepository!.updateMesureByID(mesureModel);
    return true;
  }

  Future<bool> AddMesure(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id) async {
    var mesure = await mesuresRepository!
        .addMesure(dateMesurefield, Mesurefield, DescriptionField, id);
    return true;
  }

  Future<bool> DeleteMesureByID(int id) async {
    var mesureModel = await mesuresRepository!.deleteMesureByID(id);
    return true;
  }
}
