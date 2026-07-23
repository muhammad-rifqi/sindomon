import 'package:flutter/material.dart';

class FormTambahPolres extends StatefulWidget {
  const FormTambahPolres({super.key});

  @override
  State<FormTambahPolres> createState() => _FormTambahPolresState();
}

class _FormTambahPolresState extends State<FormTambahPolres> {
  // final poldaID = TextEditingController();
  int? selectedPoldaId;

  final List<Map<String, dynamic>> daftarPolda = [
    {"id": 1, "namaPolda": "Polda Metro Jaya"},
    {"id": 2, "namaPolda": "Polda Jawa Barat"},
    {"id": 3, "namaPolda": "Polda Jawa Tengah"},
  ];

  final namaPolres = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TAMBAH POLRES BARU",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 25),

        const Text(
          "Nama Polda *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<int>(
          value: selectedPoldaId,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Pilih Polda",
          ),
          items:
              daftarPolda.map((polda) {
                return DropdownMenuItem<int>(
                  value: polda["id"], 
                  child: Text(polda["namaPolda"]), 
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedPoldaId = value;
            });
          },
        ),

        const SizedBox(height: 20),

        const Text(
          "Nama Polres*",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: namaPolres,
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
