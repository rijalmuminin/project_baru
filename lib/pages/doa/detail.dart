import 'package:flutter/material.dart';

class DoaDetailScreen extends StatelessWidget {
  final String id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  DoaDetailScreen({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(doa)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Ayat:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(ayat),
            SizedBox(height: 12),
            Text('Latin:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(latin),
            SizedBox(height: 12),
            Text('Artinya:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(artinya),
          ],
        ),
      ),
    );
  }
}
