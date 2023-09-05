import 'dart:developer';
import 'package:db_miner/modal/api_modal.dart';
import 'package:db_miner/modal/likedmodal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  //savedtable
  String quotesTable = "QuotesTable";
  String qtId = "Id";
  String qtQuotes = "quote";
  String qtAuthor = "author";
  String qtCategory = "category";

  //likedTable
  String likedTable = "likedTable";
  String qtLId = "FaId";
  String qtLQuotes = "FaQuotes";
  String qtLCategory = "FaCategory";
  String qtLauthor = "FaAuthor";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "QT4.db";

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
        db
            .execute(
                'CREATE TABLE IF NOT EXISTS $likedTable ($qtId INTEGER PRIMARY KEY AUTOINCREMENT ,$qtLQuotes TEXT , $qtLauthor TEXT , $qtLCategory TEXT)')
            .then(
              (value) => log("Liked Table Created"),
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

  Future<int> addliked(
      {required String quotes,
      required String category,
      required String author}) async {
    String query =
        "INSERT INTO $likedTable($qtLQuotes,$qtLCategory,$qtLauthor) VALUES(?,?,?)";
    List args = [quotes, category, author];
    return await database.rawInsert(query, args);
  }

  Future<List<LikeModal>?> displayLiked() async {
    String sql = "SELECT * FROM $likedTable";
    List data = await database.rawQuery(sql);
    log(data.toString());
    List<LikeModal> alldata =
        data.map((e) => LikeModal.fromMap(data: e)).toList();
    return alldata;
  }

  Future<List<ApiModal>?> displayQuotes() async {
    String query = "SELECT * FROM $quotesTable";

    List quotes = await database.rawQuery(query);

    List<ApiModal> allQuotes =
        quotes.map((e) => ApiModal.fromApi(data: e)).toList();

    return allQuotes;
  }
}
