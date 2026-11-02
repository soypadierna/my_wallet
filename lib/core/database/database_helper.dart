import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract final class DbTables {
  static const String accounts = 'accounts';
  static const String contacts = 'contacts';
  static const String transactions = 'transactions';
}

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static const String _dbName = 'my_wallet.db';
  static const int _dbVersion = 1;

  Database? _db;

  Future<Database> get database async => _db ??= await _open();

  Future<Database> _open() async {
    final path = join(await getDatabasesPath(), _dbName);
    return openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DbTables.accounts} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        currency TEXT NOT NULL,
        balance REAL NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE ${DbTables.contacts} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        card_last4 TEXT NOT NULL,
        avatar_path TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE ${DbTables.transactions} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        type TEXT NOT NULL,
        icon_key TEXT NOT NULL,
        created_at INTEGER NOT NULL
      )
    ''');
    await _seed(db);
  }

  Future<void> _seed(Database db) async {
    final now = DateTime.now();
    final batch = db.batch();

    batch.insert(DbTables.accounts, {
      'currency': 'USD',
      'balance': 12329.20,
    });

    const contacts = <Map<String, Object?>>[
      {'name': 'Samantha Jones', 'card_last4': '2766', 'avatar_path': null},
      {'name': 'Emma Clark', 'card_last4': '4821', 'avatar_path': null},
      {'name': 'Liam Brown', 'card_last4': '9034', 'avatar_path': null},
      {'name': 'Olivia Davis', 'card_last4': '1357', 'avatar_path': null},
    ];
    for (final contact in contacts) {
      batch.insert(DbTables.contacts, contact);
    }

    final transactions = <Map<String, Object?>>[
      {
        'title': 'Dribbble',
        'amount': 15.0,
        'type': 'expense',
        'icon_key': 'dribbble',
        'created_at': now.subtract(const Duration(days: 1)).millisecondsSinceEpoch,
      },
      {
        'title': 'Hannah Jones',
        'amount': 200.0,
        'type': 'income',
        'icon_key': 'transfer_in',
        'created_at': now.subtract(const Duration(hours: 3)).millisecondsSinceEpoch,
      },
      {
        'title': 'Spotify',
        'amount': 8.0,
        'type': 'expense',
        'icon_key': 'spotify',
        'created_at': DateTime(2024, 5, 10).millisecondsSinceEpoch,
      },
    ];
    for (final tx in transactions) {
      batch.insert(DbTables.transactions, tx);
    }

    await batch.commit(noResult: true);
  }
}