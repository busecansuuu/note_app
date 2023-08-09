import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/databaseservices.dart';


class ListelemePage extends StatelessWidget {
  const ListelemePage({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOTE APP"),
        elevation: 4,
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firebaseFirestore.collection("notes").snapshots(),
        builder: (context, snapshot) {
          
          
          if (snapshot.hasError) {
            return const Text('Veri alınamadı.'); // Hata durumunda gösterilecek widget
          }
          
          final docs = snapshot.data!.docs;
          
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final res = docs[index].data() as Map<String, dynamic>;
              final baslik = res['başlık'] ?? ''; // Başlık değeri alınıyor
              
              return Card(
                child: ExpansionTile(
                  title: Text(baslik),
                  // Diğer ExpansionTile içeriği buraya eklenebilir
                ),
              );
            },
          );
        },
      ),
    );
  }
}
