//
// import 'dart:io';
// import 'package:flutterui/models/book_library.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// import '../models/book_library.dart';
//
// class DatabaseHelper{
//   static const _databaseName= 'bookily.db';
//   static const _databaseVersion= 1;
//   //singleton class
//   DatabaseHelper.internal();
//   static final DatabaseHelper instance=DatabaseHelper.internal();
//   Database _database;
//   Future <Database> get database async{
//     if (_database != null){
//       return _database;
//     }
//
//     _database = await _initDatabase();
//     return _database;
//   }
// _initDatabase()async{
//     Directory dataDirectory=await getApplicationDocumentsDirectory();
//     String dbPath = join(dataDirectory.path, _databaseName);
//     return await openDatabase(dbPath, version: _databaseVersion, onCreate: _onCreateDB);
// }
//   _onCreateDB(Database db, int version)async{
//       db.execute('''
//         CREATE TABLE books(
//          id INTEGER PRIMARY KEY AUTOINCREMENT,
//          title TEXT NOT NULL,
//         Description TEXT NOT NULL,
//          Image TEXT NOT NULL,
//         audio_file TEXT NOT NULL,
//         )
//         ''');
//
//
//   }
//
//
// }
//
// -------------------------------------------------