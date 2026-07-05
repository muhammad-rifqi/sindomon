import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class FormTambahSenjata extends StatefulWidget {
  const FormTambahSenjata({super.key});

  @override
  State<FormTambahSenjata> createState() => _FormTambahSenjataState();
}

class _FormTambahSenjataState extends State<FormTambahSenjata> {
  final noSeri = TextEditingController();
  final tahunPengadaan = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  Uint8List? _imageBytes;

  String kategori = "Pistol";
  String statusKelayakan = "Layak";

  Future<void> _showPicker() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Galeri"),
                onTap: () async {
                  Navigator.pop(context);

                  final XFile? file = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (file != null) {
                    final bytes = await file.readAsBytes();

                    setState(() {
                      _imageBytes = bytes;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TAMBAH DATA SENJATA",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 25),

          /// No Seri
          const Text(
            "No Seri *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: noSeri,
            decoration: const InputDecoration(
              hintText: "Masukkan No Seri",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          /// Kategori
          const Text(
            "Kategori Senjata *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: kategori,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: "Pistol", child: Text("Pistol")),
              DropdownMenuItem(value: "Revolver", child: Text("Revolver")),
              DropdownMenuItem(
                value: "Senapan Serbu",
                child: Text("Senapan Serbu"),
              ),
              DropdownMenuItem(
                value: "Senapan Laras Panjang",
                child: Text("Senapan Laras Panjang"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                kategori = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          /// Tahun Pengadaan
          const Text(
            "Tahun Pengadaan *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          TextFormField(
            controller: tahunPengadaan,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Contoh : 2024",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          /// Status Kelayakan
          const Text(
            "Status Kelayakan *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: statusKelayakan,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: "Layak", child: Text("Layak")),
              DropdownMenuItem(
                value: "Perlu Perbaikan",
                child: Text("Perlu Perbaikan"),
              ),
              DropdownMenuItem(
                value: "Tidak Layak",
                child: Text("Tidak Layak"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                statusKelayakan = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          /// Upload Foto
          const Text(
            "Foto Senjata *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                _imageBytes != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 180,
                      ),
                    )
                    : const Center(
                      child: Icon(Icons.image, size: 80, color: Colors.grey),
                    ),
          ),

          const SizedBox(height: 12),

          OutlinedButton.icon(
            onPressed: () {
              _showPicker();
            },
            icon: const Icon(Icons.photo_camera),
            label: const Text("Pilih Foto"),
          ),

          const SizedBox(height: 30),

          /// Tombol Submit
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text("Submit", style: TextStyle(fontSize: 18)),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "* Semua data wajib diisi",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
