import 'dart:developer';
import 'package:db_miner/modal/api_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  //maintable
  String quotesTable = "QuotesTable";
  String qtId = "Id";
  String qtQuotes = "quote";
  String qtAuthor = "author";
  String qtCategory = "category";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "QT3.db";

    String finalPath = join(dbPath, dbName);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE IF NOT EXISTS $quotesTable ($qtId INTEGER PRIMARY KEY AUTOINCREMENT , $qtQuotes TEXT , $qtCategory TEXT ,$qtAuthor) ')
            .then(
              (value) => log("Transaction Table are Created : DONE "),
            );
      },
    );
  }

  Future<int> insertQuotes(
      {required String quotes,
      required String category,
      required String author}) async {
    String query =
        " INSERT INTO $quotesTable($qtQuotes,$qtCategory,$qtAuthor) VALUES( ? , ? , ?) ";
    List args = [quotes, category, author];
    int Quotes = await database.rawInsert(query, args);

    return Quotes;
  }

  Future<List<ApiModal>?> displayQuotes() async {
    String query = "SELECT * FROM $quotesTable";

    List quotes = await database.rawQuery(query);
    log(quotes.toString());

    List<ApiModal> allQuotes =
        quotes.map((e) => ApiModal.fromApi(data: e)).toList();

    return allQuotes;
  }
}
