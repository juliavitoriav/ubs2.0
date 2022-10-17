

import 'package:flutter/material.dart';
import 'package:ubs_arasaude/BD.dart';
import 'package:ubs_arasaude/UBS_dao.dart';

import 'package:ubs_arasaude/pag_ubs.dart';
import 'package:ubs_arasaude/var_ubs.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05A4AB), appBar: AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF05A4AB),
    ),
      body: buildCard(),
    );
  }
  buildCard(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child:  FutureBuilder<List<VarUbs>>(
            future: UbsDao().listarPacotes(),
            builder: (context, snapshot){
              if (snapshot.hasData) {
                List<VarUbs> lista = snapshot.data ?? [];

                return  ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {

                    if(index % 2 == 0) {
                      return PagUbs(varUbs: lista[index], color: const Color(0xFFFFFBF0), cor: Colors.black,);

                    } else {
                      return PagUbs(varUbs: lista[index], color: const Color(0xFF46707B), cor: const Color(0xFFFFFBF0),);
                    }

                  }
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
        ),

    );
  }






}