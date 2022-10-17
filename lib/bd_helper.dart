import 'dart:async';



class DBHelper {
  initDB() async {
    String databasesPath = await getDatabasesPath();
    String databaseName = join(databasesPath, 'pacotes.db');
    var db = await openDatabase(databaseName,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    print(databaseName);
    return db;
  }

  onCreate(Database db, int version) async {
    String sql = 'CREATE TABLE package (id INTEGER PRIMARY KEY, adress varchar(100), district varchar(100), code varchar(100), hour varchar(100), name varchar(100), url_image varchar(100),phone varchar(100) ;';
    await db.execute(sql);

    

    sql =
    "INSERT INTO package (id, adress, district, code, hour, name, url_image) VALUES (1, 'R. São Francisco, 154', 'Centro',  '57300-080', '24', '3522-1622', 'Hospital Regional de Arapiraca',  'lib/assets/images/hospital2.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, adress, district, code, hour, name, url_image) VALUES (2, 'R. Fernandes Lima, 312', 'Centro',  '57300-070',  '24', '3522-1688','Nossa Senhora de Fátima','lib/assets/images/hospital1.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, adress, district, code, hour, name, url_image) VALUES (3, 'Al-220, km 5', 'Sen. Arnon de Melo',  '57315-745',  '24', '3539-8634',  'Hospita de Emergência do Agreste', 'lib/assets/images/hospital2.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, adress, district, code, hour, name, url_image) VALUES (4, 'Al-220, km 4', 'Sen. Arnon de Melo', '57515-745',  '24', '3521-4781', 'Hospital Chama',  'lib/assets/images/hospital1.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, adress, district, code, hour, name, url_image) VALUES (5, 'R. José Alexandre, 60',  'Baixão',  '57305-400', '08:00 às 18:00','99656-0928', 'Hospital São Lucas', 'lib/assets/images/hospital2.png');";
    await db.execute(sql);

  }