import 'package:ReachUp/Model/Local.dart';
import 'package:ReachUp/www/ReachUpAPI.dart';


class LocalRepository extends ReachUpAPI{

  LocalRepository() : super(null)
  {
  }
  
   Future<List<Local>> search(String s) async{
      await super.httpGet("Local/Search?s=$s");

      if(super.response.statusCode == 200)
       return super.toList<Local>();
      else
      return null;
    }
}


