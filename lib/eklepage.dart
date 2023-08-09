import 'package:flutter/material.dart';
import 'package:noteapp/databaseservices.dart';

class EklePage extends StatefulWidget {
  const EklePage({super.key});

  @override
  State<EklePage> createState() => _EklePageState();
}

class _EklePageState extends State<EklePage> {
  TextEditingController baslikController = TextEditingController();

  TextEditingController detayController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
                      return "lütfen başlık giriniz.";
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
                      return "lütfen not giriniz.";
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
                        DataBaseService.veriEkle(baslikController.text, detayController.text);
                      }
                    },
                    child: const Text("EKLE"))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
