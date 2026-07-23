import 'package:flutter/material.dart';

class FormTambahPolda extends StatefulWidget {
  const FormTambahPolda({super.key});

  @override
  State<FormTambahPolda> createState() => _FormTambahPoldaState();
}

class _FormTambahPoldaState extends State<FormTambahPolda> {
  String? pangkat;

  final namaPolda = TextEditingController();

  final lat = TextEditingController();

  final long = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TAMBAH POLDA BARU",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 25),

        const Text(
          "Nama Polda *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: namaPolda,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        const Text("Latitude*", style: TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 8),

        TextFormField(
          controller: lat,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        const Text("Longitude *", style: TextStyle(fontWeight: FontWeight.bold)),

        TextFormField(
          controller: long,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
            ),
            onPressed: () {},
            child: const Text("Simpan Data", style: TextStyle(fontSize: 18)),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Silahkan lengkapi semua data bertanda *",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
