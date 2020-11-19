import 'package:ReachUp/Model/Communique.model.dart';
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

  Future<bool> add(int localId, int type, String description, DateTime start,
      DateTime end) async {
    communique = new Communique();
    communique.localId = localId;
    communique.type = type;
    communique.description = description;
    communique.startDate = start;
    communique.endDate = end;
    final data = communique.toJson();
    return communiqueRepository.add(data);
  }

  Future<bool> bindSubCategories() async {
    communique = new Communique();
    return communiqueRepository.bindSubCategories(communique);
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
