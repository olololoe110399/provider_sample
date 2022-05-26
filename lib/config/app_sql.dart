class AppSQL {
  const AppSQL._();
  static const nameDb = 'manga_app.db';
  static const itemsTable = 'items';
  static const createItemsTable =
      'CREATE TABLE items (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT, create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)';
}
