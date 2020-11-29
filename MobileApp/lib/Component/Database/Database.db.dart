import 'package:get_storage/get_storage.dart';

class Database {
  final box = GetStorage();
  String response;

  Database.insert({String key, String value}) {
    box.write(key, value);
  }

  Database.select({String key}) {
    this.response = box.read(key);
  }

  Database.update({String key, String value}) {
    
    box.remove(key).then((v) {
      box.write(key, value);
    });
  }

  Database.delete({String key}){
    box.remove(key);
  }


}
