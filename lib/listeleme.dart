import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noteapp/databaseservices.dart';
import 'package:noteapp/eklepage.dart';
import 'package:noteapp/g%C3%BCnncelleme.dart';

class ListelemePage extends StatelessWidget {
  const ListelemePage({Key? key}) : super(key: key);
//sayfa yönlendirme fonksiyonu
navigation(BuildContext context,Widget next){
  Navigator.push(context, MaterialPageRoute(builder: (_)=>next));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //eklemeye yönlendirme deftere ekle
      floatingActionButton: FloatingActionButton(onPressed: (){

        navigation(context,const EklePage());
      },
      child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("NOTE APP"),
        elevation: 4,
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("notes").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Veri alınamadı.'); // Hata durumunda gösterilecek widget
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return 
            Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/notebook.jpg'), // pubspec.yaml'da belirttiğiniz resim yolunu buraya ekleyin
                fit: BoxFit.cover, // Resmin nasıl sığdırılacağını belirleyebilirsiniz
              ),
            ),
              child: ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final res = docs[index].data() as Map<String, dynamic>;
                      final baslik = res['baslik'] as String? ?? ''; // Başlık değeri alınıyor
                      final detay = res['detay'] as String? ?? '';
                      //silme deftere ekle
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                
                          color: Colors.red,
                        ),
                        onDismissed: (v) {
                          DataBaseService.delete(docs[index].id);
                        },
                        child: Card(
                          child: ExpansionTile(
                            title: Text(baslik),
                            //yeni eklendi
                            leading: IconButton(
                              onPressed: () {
                                // Düzenleme işlemini burada gerçekleştirin
                                navigation(context, GuncellemePage(
                
                                  id: docs[index].id,
                                  baslik: baslik,
                                  detay: detay,
                                ));
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("not: $detay"),
                              ),
                            ],
                            // Diğer ExpansionTile içeriği buraya eklenebilir
                          ),
                        ),
                      );
                    },
            
                      ),
            );
        },
      ),
    );
  }
}
