
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificationService {
  NotificationService.internal();
  static final NotificationService notificationService =
      NotificationService.internal();

  factory NotificationService() => notificationService;
  static Database? notificationDatabase;
  final String _dbName = "notificationdb";
  final String _tableName = 'notification';

  Future<Database> get notificaitondatabase async {
    if (notificationDatabase != null) {
      return notificationDatabase!;
    }
    return notificationDatabase = await initialDatabase();
  }

  Future<Database> initialDatabase() async {
    final databasepath = await getDatabasesPath();
    final path = join(_dbName, databasepath);
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, body TEXT, dateTime TEXT)');
      },
      version: 1,
    );
  }
}
