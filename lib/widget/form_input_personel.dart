import 'package:flutter/material.dart';

class FormTambahPersonel extends StatefulWidget {
  const FormTambahPersonel({super.key});

  @override
  State<FormTambahPersonel> createState() => _FormTambahPersonelState();
}

class _FormTambahPersonelState extends State<FormTambahPersonel> {
  String? pangkat;

  final username = TextEditingController();

  final jabatan = TextEditingController();

  final polres = TextEditingController();

  final status = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TAMBAH PERSONEL BARU",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 25),

        const Text(
          "Nama Lengkap/Username *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: username,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        const Text("Pangkat *", style: TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: pangkat,
          hint: const Text("Pilih Pangkat"),
          items: const [
            DropdownMenuItem(value: "kepala", child: Text("Kepala")),
            DropdownMenuItem(value: "wakil", child: Text("Wakil")),
            DropdownMenuItem(value: "bripda", child: Text("Bripda")),
          ],
          onChanged: (v) {
            setState(() {
              pangkat = v;
            });
          },
        ),

        const SizedBox(height: 20),

        const Text("Jabatan *", style: TextStyle(fontWeight: FontWeight.bold)),

        TextFormField(
          controller: jabatan,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        const Text("Polres *", style: TextStyle(fontWeight: FontWeight.bold)),

        TextFormField(
          controller: polres,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        const Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),

        TextFormField(
          controller: status,
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
          "Lengkapi semua data bertanda *",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
