import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../pages/pangaturan.dart';
import '../pages/dashboard.dart';
import '../pages/report.dart';
import '../pages/add_personel_page.dart';

class PersonelPage extends StatefulWidget {
  const PersonelPage({super.key});

  @override
  State<PersonelPage> createState() => _PersonelPageState();
}

class _PersonelPageState extends State<PersonelPage> {
  final List<Map<String, dynamic>> personel = [
    {
      "username": "Bripda Ahmad Fauzi",
      "pangkat": "PAN",
      "jabatan" : "Dunar Jabatan",
      "polres": "Polda",
      "status": "pasteaf6",
    },
    {
      "username": "Bripda Ahmad Fauzi",
      "pangkat": "PAN",
      "jabatan" : "Dunar Jabatan",
      "polres": "Polda",
      "status": "pasteaf6",
    },
    {
      "username": "Bripda Ahmad Fauzi",
      "pangkat": "PAN",
      "jabatan" : "Dunar Jabatan",
      "polres": "Polda",
      "status": "pasteaf6",
    },
    {
      "username": "Bripda Ahmad Fauzi",
      "pangkat": "PAN",
      "jabatan" : "Dunar Jabatan",
      "polres": "Polda",
      "status": "pasteaf6",
    },
    {
      "username": "Bripda Ahmad Fauzi",
      "pangkat": "PAN",
      "jabatan" : "Dunar Jabatan",
      "polres": "Polda",
      "status": "pasteaf6",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Row(
            children: [
              /// ========================
              /// SIDEBAR
              /// ========================
              Container(
                width: 240,
                color: const Color(0xff221B58),
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    const Text(
                      "SINDOMON",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 40),

                     Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          menu(Icons.dashboard, "Dashboard"),
                          menu(Icons.description, "Laporan"),
                          menu(Icons.map, "Wilayah"),
                          menu(Icons.document_scanner, "Inventaris"),
                          menu(Icons.people_alt, "Organisasi"),
                          menu(Icons.list, "Satwa"),
                          menu(Icons.list, "Senjata Api"),
                          menu(Icons.list, "Kategori Senjata"),
                          menu(Icons.inbox, "Kotak Masuk"),
                          menu(Icons.outbox, "Kotak Keluar"),
                          menu(Icons.people, "Personel", selected: true),
                          menu(Icons.list, "Stok Amunisi"),
                          menu(Icons.device_hub, "Perangkat"),
                          menu(Icons.people, "Pengguna"),
                          menu(Icons.settings, "Pengaturan"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// ========================
              /// CONTENT
              /// ========================
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Manajemen Personel",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),

                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddPersonelPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Tambah Personel"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Cari berdasarkan Nama...",
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.white70, // warna hint
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: DataTable(
                                  headingTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  columns: const [
                                    DataColumn(label: Text("USERNAME / NRP")),

                                    DataColumn(label: Text("PANGKAT")),

                                    DataColumn(label: Text("JABATAN")),

                                    DataColumn(label: Text("POLRES")),

                                    DataColumn(label: Text("STATUS")),

                                    DataColumn(label: Text("AKSI")),
                                  ],
                                  rows:
                                      personel
                                          .map(
                                            (e) => DataRow(
                                              cells: [
                                                DataCell(Text(e["username"])),

                                                DataCell(Text(e["pangkat"])),

                                                DataCell(Text(e["jabatan"])),

                                                DataCell(Text(e["polres"])),

                                                DataCell(Text(e["status"])),

                                                DataCell(
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.edit,
                                                        ),
                                                        onPressed: () {},
                                                      ),

                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget menu(IconData icon, String title, {bool selected = false}) {
    return Container(
      color:
          selected ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        onTap: () {
          Widget page;

        switch (title) {
          case "Dashboard":
            page = const DashboardPage();
            break;

          case "Pengaturan":
            page = const AccountSettingPage();
            break;
          
          case "Laporan":
            page = const ReportPage();
            break;

          default:
            page = const DashboardPage();
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
        },
      ),
    );
  }
}
