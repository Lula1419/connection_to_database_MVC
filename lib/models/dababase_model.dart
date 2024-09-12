
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseModel{
  Database? _database;

  Future<void> connect() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "my_database_mvc.db");

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version){
        return db.execute("CREATE TABLE test (id INTEGER KEY, name TEXT)",);
      },
    );
  }//Future

  void disconnect(){
    _database?.close();
    _database = null;
  }

  bool isConnected(){
    return _database != null;
  }

}