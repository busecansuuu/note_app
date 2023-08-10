import 'package:flutter/material.dart';
import 'package:noteapp/databaseservices.dart';

class GuncellemePage extends StatefulWidget {
  final String? baslik;
  final String? detay;
  final String? id;

  GuncellemePage({Key? key, this.baslik, this.id, this.detay}) : super(key: key);

  @override
  State<GuncellemePage> createState() => _GuncellemePageState();
}

class _GuncellemePageState extends State<GuncellemePage> {
  late TextEditingController baslikController;
  late TextEditingController detayController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    baslikController = TextEditingController(text: widget.baslik);
    detayController = TextEditingController(text: widget.detay);
  }

  @override
  void dispose() {
    baslikController.dispose();
    detayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NOTE APP"),
        elevation: 4,
        centerTitle: true,
        backgroundColor: Colors.deepPurple[200],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: baslikController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Lütfen başlık giriniz.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "BAŞLIK GİRİNİZ",
                      labelStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: detayController,
                    maxLines: 7,
                    minLines: 1,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Lütfen not giriniz.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "NOTUNUZU GİRİNİZ",
                      labelStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        DataBaseService.update(widget.id!, baslikController.text, detayController.text);
                      }
                    },
                    child: const Text("GÜNCELLE"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
