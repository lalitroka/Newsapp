import 'package:path/path.dart';
import 'package:practise/model/savenews.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService._internal();
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  static Database? _database;
  final String _dbName = "news_database.db";
  final String _tableName = "news";

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, author TEXT, urlToImage TEXT, description TEXT, title TEXT, publishedAt TEXT)');
             
      },
      version: 1,
    );
  }

  Future<void> insertNews(NewsDbModel newsModel) async {
    final db = await _databaseService.database;
    await db.insert(
      _tableName,
      newsModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<NewsDbModel>> getNews() async {
    final db = await _databaseService.database;
    final List<Map<String, Object?>> newsMap = await db.query(_tableName);
    return newsMap.map((e) => NewsDbModel.fromMap(e)).toList();
  }
}

