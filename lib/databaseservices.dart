import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DataBaseService {
  static Future<void> veriEkle(String baslik, String detay) async {
    try {
      await firebaseFirestore.collection('notes').add({
        "baslik": baslik,
        "detay": detay,
      });
      print("Ekleme başarılı");
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }
//silme
  static Future<void> delete(String id)async{

await firebaseFirestore.collection("notes").doc(id).delete();
  }
  //güncelleme
  static Future<void> update(String id,String baslik, String detay)async{

await firebaseFirestore.collection("notes").doc(id).update({"baslik":baslik,"detay":detay});
  }
}
