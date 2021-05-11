import 'dart:io';

import 'package:nyt_news/core/constants.dart';
import 'package:nyt_news/core/entities/article_entity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBClient {
  DBClient._();
  static final DBClient dbClient = DBClient._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATA_BASE_NAME);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE Article ("
        "id INTEGER,"
        "url TEXT,"
        "title TEXT,"
        "article_abstract TEXT,"
        "image_url TEXT,"
        "isFavorite BIT"
        ")",
      );
    });
  }

  Future<int?> insertArticle(ArticleEntity article) async {
    final db = await database;
    return await db?.rawInsert(
        "INSERT Into Article (id,url,title,article_abstract,image_url,isFavorite)"
        " VALUES (?,?,?,?,?,?)",
        [
          article.id,
          article.url,
          article.title,
          article.articleAbstract,
          article.imageUrl,
          article.isFavorite
        ]);
  }

  Future<int?> updateArticle(ArticleEntity article) async {
    final db = await database;
    return await db?.update(TABLE_NAME_ARTICLE, article.toJson(),
        where: "id = ?", whereArgs: [article.id]);
  }

  Future<int?> deleteArticle(int id) async {
    final db = await database;
    return await db
        ?.delete(TABLE_NAME_ARTICLE, where: "id = ?", whereArgs: [id]);
  }

  Future<ArticleEntity?> getArticle(int id) async {
    final db = await database;
    if (db == null) {
      return null;
    }
    final res =
        await db.query(TABLE_NAME_ARTICLE, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ArticleEntity.fromJson(res.first) : null;
  }

  Future<List<ArticleEntity>> getAllArticles() async {
    final db = await database;
    var res = await db?.query(TABLE_NAME_ARTICLE);

    if (res != null && res.isNotEmpty) {
      return res.map((e) => ArticleEntity.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
