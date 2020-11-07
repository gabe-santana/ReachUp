import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/Repositories/Local.repository.dart';

class LocalController{
  LocalRepository localRepository;

  LocalController(){
    this.localRepository = new LocalRepository();
  }
  //Authorize
  //HttpGet
  Future<List<Local>> search(String search) async{
      return localRepository.search(search);
  }
}

