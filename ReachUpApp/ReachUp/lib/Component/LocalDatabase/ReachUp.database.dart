import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class ReachUpDatabase
{
  static final ReachUpDatabase _singleton = ReachUpDatabase._();

  static ReachUpDatabase get instance => _singleton;

  Completer<Database> _dbOpenCompleter;

  ReachUpDatabase._();

  Future<Database> get database async{
    if(_dbOpenCompleter == null){
        _dbOpenCompleter = Completer(); 
         
        _openDatabase();
    }

    return _dbOpenCompleter.future; 
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, "reachup.db");
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }


}