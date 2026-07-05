import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../pages/add_user.dart';
import '../pages/pangaturan.dart';
import '../pages/dashboard.dart';
import '../pages/report.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final List<Map<String, dynamic>> users = [
    {
      "username": "123456 / Bripda Ahmad Fauzi",
      "role": "Operator Kewilayahan",
      "polda": "Polda Metro Jaya",
      "status": true,
    },
    {
      "username": "654321 / AKP Siti Rahmawati",
      "role": "Eksekutif Pimpinan",
      "polda": "Polda Jawa Barat",
      "status": true,
    },
    {
      "username": "789012 / Iptu Budi Santoso",
      "role": "Operator Kewilayahan",
      "polda": "Polda Jawa Tengah",
      "status": false,
    },
    {
      "username": "345678 / Kompol Dewi Lestari",
      "role": "Eksekutif Pimpinan",
      "polda": "Polda Jawa Timur",
      "status": true,
    },
    {
      "username": "901234 / Ipda Eko Prasetyo",
      "role": "Operator Kewilayahan",
      "polda": "Polda Bali",
      "status": true,
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
                          menu(Icons.people, "Personel"),
                          menu(Icons.list, "Stok Amunisi"),
                          menu(Icons.device_hub, "Perangkat"),
                          menu(Icons.people, "Pengguna", selected: true),
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
                            "Manajemen Pengguna Sistem",
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
                                  builder: (context) => const AddUserPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Tambah Akun"),
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
                            hintText: "Cari berdasarkan Nama atau NRP...",
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

                                    DataColumn(label: Text("PERAN")),

                                    DataColumn(label: Text("JURISDIKSI")),

                                    DataColumn(label: Text("STATUS")),

                                    DataColumn(label: Text("AKSI")),
                                  ],
                                  rows:
                                      users
                                          .map(
                                            (e) => DataRow(
                                              cells: [
                                                DataCell(Text(e["username"])),

                                                DataCell(Text(e["role"])),

                                                DataCell(Text(e["polda"])),

                                                DataCell(
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 6,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          e["status"]
                                                              ? Colors
                                                                  .green
                                                                  .shade100
                                                              : Colors
                                                                  .red
                                                                  .shade100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      e["status"]
                                                          ? "Active"
                                                          : "Inactive",
                                                      style: TextStyle(
                                                        color:
                                                            e["status"]
                                                                ? Colors.green
                                                                : Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),

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
