import 'package:poke_api_app/core/local_db/const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static final _databaseName = LOCAL_DB_NAME;
  static final _databaseVersion = LOCAL_DB_VERSION;

  //make this a singleton class
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDataBase();
    return _database;
  }

  //creamos una nueva intancia de la clase
  _initDataBase() async {
    //obtenemos la referencia de la DB
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $POKEMON_TABLE_NAME($POKEMON_ID INTEGER PRIMARY KEY, $POKEMON_NAME TEXT)");
  }
}

/** " CREATE TABLE $POKEMON_TABLE_NAME($POKEMON_ID INTEGER PRIMARY KEY, $POKEMON_NAME TEXT," +
            "$POKEMON_ORDER INTEGER, $POKEMON_SPRITE TEXT, $POKEMON_TYPE_ONE TEXT, $POKEMON_TYPE_TWO TEXT)" */

/** 
" CREATE TABLE $POKEMON_TABLE_NAME($POKEMON_ID INTEGER PRIMARY KEY AUTOINCREMET, $POKEMON_NAME TEXT," +
            "$POKEMON_ORDER INTEGER"
 */
