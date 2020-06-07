import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  Database _myDateBase;
  //定义表名
  final String tableName = "userTable";
  //定义各个字段名
  final String columnId = "id";
  final String columnName = "name";
  final String columnPassword ="password";

  //获取数据库
  Future get db async {
    if (_myDateBase != null) {
      print('数据库已存在');
      return _myDateBase;
    } else
      _myDateBase = await initDb();
    return _myDateBase;
  }

  //初始化数据库，根据路径版本号新建数据库
  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "userDB.db");
    var dataBase = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('数据库创建成功，version： 1');
    return dataBase;
  }

  //新建数据库表
  FutureOr _onCreate(Database db, int version) async {
    await db.execute('''create table $tableName(
    $columnId integer primary key autoincrement,
    $columnName text not null,
    $columnPassword text not null)''');
    print('Table is created');
  }
}