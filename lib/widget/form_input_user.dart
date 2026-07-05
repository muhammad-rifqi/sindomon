import 'package:flutter/material.dart';

class FormTambahUser extends StatefulWidget {
  const FormTambahUser({super.key});

  @override
  State<FormTambahUser> createState() => _FormTambahUserState();
}

class _FormTambahUserState extends State<FormTambahUser> {

  bool aktif = true;

  String role = "Operator Polda";

  String? polda = "Polda Jawa Barat";

  final username = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "TAMBAH AKUN OPERATOR BARU",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          "Username *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: username,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Password *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Role *",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: role,
          items: const [

            DropdownMenuItem(
              value: "Super Admin",
              child: Text("Super Admin"),
            ),

            DropdownMenuItem(
              value: "Operator Polda",
              child: Text("Operator Polda"),
            ),

            DropdownMenuItem(
              value: "Operator Polres",
              child: Text("Operator Polres"),
            ),

          ],
          onChanged: (v){
            setState(() {
              role = v!;
            });
          },
        ),

        const SizedBox(height: 20),

        if(role=="Operator Polda") ...[

          const Text(
            "Polda *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          DropdownButtonFormField<String>(
            value: polda,
            items: const [

              DropdownMenuItem(
                value: "Polda Jawa Barat",
                child: Text("Polda Jawa Barat"),
              ),

              DropdownMenuItem(
                value: "Polda Metro Jaya",
                child: Text("Polda Metro Jaya"),
              ),

              DropdownMenuItem(
                value: "Polda Jawa Tengah",
                child: Text("Polda Jawa Tengah"),
              ),

            ],
            onChanged: (v){
              setState(() {
                polda = v;
              });
            },
          ),

          const SizedBox(height: 6),

          const Text(
            "Wajib diisi jika Operator Polda",
            style: TextStyle(
              color: Colors.red,
            ),
          ),

        ],

        const SizedBox(height: 20),

        const Text(
          "Status",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        Row(
          children: [

            Switch(
              value: aktif,
              onChanged: (v){
                setState(() {
                  aktif = v;
                });
              },
            ),

            Text(aktif ? "Aktif" : "Tidak Aktif")

          ],
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
            child: const Text(
              "Simpan Akun",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Lengkapi semua data bertanda *",
          style: TextStyle(
            color: Colors.grey,
          ),
        )

      ],
    );
  }
}