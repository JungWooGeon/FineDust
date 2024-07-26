import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/entity/forecast_date.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'forecast.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE Forecasts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        time TEXT,
        temperature TEXT,
        weather TEXT
      )
    ''');
  }

  Future<void> insertForecasts(List<ForecastDate> forecasts) async {
    final db = await database;
    Batch batch = db.batch();
    for (var forecast in forecasts) {
      batch.insert('Forecasts', {
        'date': forecast.date,
        'time': forecast.time,
        'temperature': forecast.temperature,
        'weather': forecast.weather
      });
    }
    await batch.commit();
  }

  Future<void> clearForecasts() async {
    final db = await database;
    await db.delete('Forecasts');
  }

  Future<List<ForecastDate>> getAllForecasts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Forecasts');

    // 조회된 데이터를 List<ForecastDate>로 변환
    return List.generate(maps.length, (i) {
      return ForecastDate(
        maps[i]['date'],
        maps[i]['time'],
        maps[i]['temperature'],
        maps[i]['weather']
      );
    });
  }
}

