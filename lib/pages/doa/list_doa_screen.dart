import 'dart:html';
import 'package:flutter/material.dart';
import 'package:project_baru/models/doa_model.dart';
import 'package:project_baru/services/doa_service.dart';
import 'package:project_baru/pages/doa/detail.dart';

class ListDoaScreen extends StatelessWidget {
  const ListDoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: FutureBuilder<List<DoaModel>>(
        future: DoaService.listDoa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataDoa = snapshot.data ?? [];
          return ListView.builder(
            itemCount: dataDoa.length,
            itemBuilder: (context, index) {
              final data = dataDoa[index];
              return ListTile(
                leading: Text(
                  '${index + 1}', 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text(data.doa),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DoaDetailScreen(
                        id: data.id.toString(),
                        doa: data.doa,
                        ayat: data.ayat,
                        latin: data.latin,
                        artinya: data.artinya,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
