import 'dart:html';
import 'package:flutter/material.dart';
import 'package:project_baru/models/doa_model.dart';
import 'package:project_baru/services/doa_service.dart';

class ListDoaScreen extends StatelessWidget {
  const ListDoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: FutureBuilder<List<DoaModel>>(
        future: DoaService.listDoa(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataDoa = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataDoa.length,
            itemBuilder: (context, item) {
              final data = dataDoa[item];
              return GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context, 
                //     MaterialPageRoute(
                //       builder: (_)=> DoaDetailScreen(
                //         id:data.id.toString(),
                //         title:data.title,
                //         body:data.body
                //         userId: data.userId.toString(),
                //       ),
                //     ),
                //   );
                // },

                child: ListTile(
                  leading: Text(data.id.toString()),
                  title: Text(data.doa),
                  subtitle: Text('Ayat: ${data.ayat}\nLatin: ${data.latin}\nArtinya: ${data.artinya}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}