import 'package:ubs_arasaude/bd_helper.dart';
import 'package:ubs_arasaude/var_ubs.dart';
import 'package:ubs_arasaude/bd_helper.dart';

class UbsDao {

  Future<List<VarUbs>> listarPacotes() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM package;';
    var result = await db.rawQuery(sql);

    List<VarUbs> lista = <VarUbs>[];
    for (var json in result) {
      VarUbs ubs = VarUbs.fromJson(json);
      lista.add(ubs);
    }

    return lista;
  }

}

