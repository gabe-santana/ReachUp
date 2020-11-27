import 'package:ReachUp/Model/Communique.model.dart';
import 'package:ReachUp/Model/CommuniqueSubCategory.model.dart';
import 'package:ReachUp/Repositories/Communique.repository.dart';

class CommuniqueController {
  CommuniqueRepository communiqueRepository;
  Communique communique;

  CommuniqueController() {
    communiqueRepository = new CommuniqueRepository();
  }

  Future<List<Communique>> getByLocal(int localId, bool general) async {
    return communiqueRepository.byLocal(localId, general);
  }

  Future<bool> add(Communique communique) async {
    return communiqueRepository.add(communique);
  }

  Future<bool> bindSubCategories(List<CommuniqueSubCategory> communiqueSubCategory) async {
    return communiqueRepository.bindSubCategories(communiqueSubCategory);
  }



  // Future<bool> disbindSubCategories(dynamic communique) async {
  //   return communiqueRepository.disbindSubCategories(communique);
  // }

  Future<bool> update(dynamic communique) async {
    return communiqueRepository.update(communique);
  }

  Future<bool> delete(int id, int type) async {
    return communiqueRepository.delete(id, type);
  }
}
