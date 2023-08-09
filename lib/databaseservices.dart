import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DataBaseService {
  static Future<void> veriEkle(String baslik, String detay) async {
    try {
      await firebaseFirestore.collection('notes').add({
        "başlık": baslik,
        "detay": detay,
      });
      print("Ekleme başarılı");
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }
}
