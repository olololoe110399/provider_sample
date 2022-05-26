import 'package:flutter/material.dart';
import 'package:sample/config/app_sql.dart';
import 'package:sample/models/item.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      AppSQL.nameDb,
      version: 1,
      onCreate: (db, version) async {
        await createItemTables(db);
      },
    );
  }

  static Future<void> createItemTables(sql.Database database) async {
    await database.execute(AppSQL.createItemsTable);
  }

  static Future<int> createItem(Item item) async {
    final db = await SQLHelper.db();

    final id = await db.insert(
      AppSQL.itemsTable,
      {
        'title': item.title,
        'description': item.description,
      },
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return id;
  }

  static Future<List<Item>> getItems() async {
    final db = await SQLHelper.db();
    final listItems = await db.query(AppSQL.itemsTable);
    return listItems.map((e) => Item.fromJson(e)).toList();
  }

  static Future<int> updateItem(Item item) async {
    final db = await SQLHelper.db();
    final result = await db.update(
        AppSQL.itemsTable,
        {
          'title': item.title,
          'description': item.description,
        },
        where: 'id=?',
        whereArgs: [item.id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete(
        AppSQL.itemsTable,
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (error) {
      debugPrint('Some thing error');
    }
  }
}
