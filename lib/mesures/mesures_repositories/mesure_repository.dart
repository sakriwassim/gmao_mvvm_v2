import '../models_mesures/add_mesure_model.dart';
import '../models_mesures/mesure_model.dart';

abstract class MesuresRepository {
  Future<List<MesureModel>> getMesureByCounter(String id);
  Future<List<MesureModel>> getAllMesures();
  Future<MesureModel> getMesureByID(String id);
  Future<MesureModel> updateMesureByID(MesureModel mesureModel);
  Future<bool> addMesure(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id);
  Future<bool> deleteMesureByID(int id);
}
