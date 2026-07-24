import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FormTambahPersonel extends StatefulWidget {
  const FormTambahPersonel({super.key});

  @override
  State<FormTambahPersonel> createState() => _FormTambahPersonelState();
}

class _FormTambahPersonelState extends State<FormTambahPersonel> {
  String? pangkat;
  final namaLengkap = TextEditingController();
  final nrp = TextEditingController();
  final jabatan = TextEditingController();
  final polres = TextEditingController();
  final status = TextEditingController();
  int? selectedPoldaId;
  int? selectedPolresId;
  List<Map<String, dynamic>> daftarPolda = [];
  List<Map<String, dynamic>> daftarPolres = [];

  Future<void> getPolda() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    try {
      final response = await http.get(
        Uri.parse('https://sindomon.yoknusantara.com/api/v1/polda'),
        headers: {"Authorization": token.toString()},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);

        setState(() {
          daftarPolda = List<Map<String, dynamic>>.from(body['data']);
        });
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getPolda();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TAMBAH PERSONEL BARU",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        const Text("NRP *", style: TextStyle(fontWeight: FontWeight.bold)),

        const SizedBox(height: 8),

        TextFormField(
          controller: nrp,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 25),

        const Text(
          "Nama Lengkap *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: namaLengkap,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

        const SizedBox(height: 20),

        const Text("Polda ID *", style: TextStyle(fontWeight: FontWeight.bold)),

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
                  value: int.parse(polda["id"]),
                  child: Text(polda["nama_polda"]),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedPoldaId = value;
              selectedPolresId = null;
              final selectedPolda = daftarPolda.firstWhere(
                (item) => int.parse(item["id"]) == value,
              );
              daftarPolres = List<Map<String, dynamic>>.from(
                selectedPolda["polres"] ?? [],
              );
            });
          },
        ),

        const SizedBox(height: 20),
        const Text(
          "Polres ID *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        DropdownButtonFormField<int>(
          value: selectedPolresId,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Pilih Polres",
          ),
          items:
              daftarPolres.map((polres) {
                return DropdownMenuItem<int>(
                  value: int.parse(polres["id"]),
                  child: Text(polres["nama_polres"]),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedPolresId = value;
            });
          },
        ),

        const SizedBox(height: 16),

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
