import '../models_mesures/add_mesure_model.dart';
import '../models_mesures/mesure_model.dart';
import 'mesure_repository.dart';

class MesuresLocal extends MesuresRepository {
  @override
  Future<List<MesureModel>> getAllMesures() {
    throw UnimplementedError();
  }

  @override
  Future<MesureModel> updateMesureByID(MesureModel mesureModel) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteMesureByID(int id) {
    throw UnimplementedError();
  }

  @override
  Future<MesureModel> getMesureByMesuresByCategorie(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<MesureModel>> getMesureByCounter(String id) {
    throw UnimplementedError();
  }

  @override
  Future<MesureModel> getMesureByID(String id) {
    // TODO: implement getMesureByID
    throw UnimplementedError();
  }

  @override
  Future<bool> addMesure(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id) {
    // TODO: implement addMesure
    throw UnimplementedError();
  }
}
