import 'package:ReachUp/Model/ClientPreference.model.dart';
import 'package:ReachUp/Model/Subcategory.model.dart';
import 'package:ReachUp/Repositories/ClientPreference.repository.dart';

class ClientPreferenceController {
  ClientePreferenceRepository clientePreferenceRepository;

  ClientPreferenceController() {
    this.clientePreferenceRepository = new ClientePreferenceRepository();
  }

  Future<bool> add(ClientPreference clientePreference) async {
    return clientePreferenceRepository.add(clientePreference);
  }

  Future<List<SubCategory>> byUser(String email) async {
    return clientePreferenceRepository.byUser(email);
  }

  Future<bool> delete(String email, int category, int subCategory) async {
    return clientePreferenceRepository.delete(email, category, subCategory);
  }
}
