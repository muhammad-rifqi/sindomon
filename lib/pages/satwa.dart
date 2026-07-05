import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../pages/pangaturan.dart';
import '../pages/dashboard.dart';
import '../pages/report.dart';
import '../pages/add_satwa.dart';

class SatwaPage extends StatefulWidget {
  const SatwaPage({super.key});

  @override
  State<SatwaPage> createState() => _SatwaPageState();
}

class _SatwaPageState extends State<SatwaPage> {
  final List<Map<String, dynamic>> listsatwa = [
    {
      "foto_satwa": "",
      "no_registrasi": "1111234567",
      "jenis": "K9",
      "nama": "Sanut Handler",
      "kualifikasi": "Narkotika",
      "jadwal_vaksin": "2025-12-10",
      "status_vaksin": "Sudah",
    },
    {
      "foto_satwa": "",
      "no_registrasi": "1111234567",
      "jenis": "K9",
      "nama": "Sanut Handler",
      "kualifikasi": "Narkotika",
      "jadwal_vaksin": "2025-12-10",
      "status_vaksin": "Sudah",
    },
    {
      "foto_satwa": "",
      "no_registrasi": "1111234567",
      "jenis": "K9",
      "nama": "Sanut Handler",
      "kualifikasi": "Narkotika",
      "jadwal_vaksin": "2025-12-10",
      "status_vaksin": "Sudah",
    },
    {
      "foto_satwa": "",
      "no_registrasi": "1111234567",
      "jenis": "K9",
      "nama": "Sanut Handler",
      "kualifikasi": "Narkotika",
      "jadwal_vaksin": "2025-12-10",
      "status_vaksin": "Sudah",
    },
    {
      "foto_satwa": "",
      "no_registrasi": "1111234567",
      "jenis": "K9",
      "nama": "Sanut Handler",
      "kualifikasi": "Narkotika",
      "jadwal_vaksin": "2025-12-10",
      "status_vaksin": "Sudah",
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
                          menu(Icons.list, "Satwa", selected: true),
                          menu(Icons.list, "Senjata Api"),
                          menu(Icons.list, "Kategori Senjata"),
                          menu(Icons.inbox, "Kotak Masuk"),
                          menu(Icons.outbox, "Kotak Keluar"),
                          menu(Icons.people, "Personel"),
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
                            "Manajemen Daftar Satwa",
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
                                  builder: (context) => const AddSatwaPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Tambah Satwa"),
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
                            hintText: "Cari Satwa...",
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
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: constraints.maxWidth,
                                      child: DataTable(
                                        columnSpacing: 20,
                                        horizontalMargin: 10,
                                        headingTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        columns: const [
                                          DataColumn(label: Text("Foto Satwa")),
                                          DataColumn(
                                            label: Text("No Registrasi"),
                                          ),
                                          DataColumn(label: Text("Jenis")),
                                          DataColumn(label: Text("Nama")),
                                          DataColumn(
                                            label: Text("Kualifikasi"),
                                          ),
                                          DataColumn(
                                            label: Text("Jadwal Vaksin"),
                                          ),
                                          DataColumn(
                                            label: Text("Status Vaksin"),
                                          ),
                                          DataColumn(label: Text("AKSI")),
                                        ],
                                        rows:
                                            listsatwa.map((e) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            4,
                                                          ),
                                                      child: Image.asset(
                                                        "assets/images/satwa.jpg",
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(e["no_registrasi"]),
                                                  ),
                                                  DataCell(Text(e["jenis"])),
                                                  DataCell(Text(e["nama"])),
                                                  DataCell(
                                                    Text(e["kualifikasi"]),
                                                  ),
                                                  DataCell(
                                                    Text(e["jadwal_vaksin"]),
                                                  ),
                                                  DataCell(
                                                    Text(e["status_vaksin"]),
                                                  ),
                                                  DataCell(
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        IconButton(
                                                          constraints:
                                                              const BoxConstraints(),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          iconSize: 20,
                                                          icon: const Icon(
                                                            Icons.edit,
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        IconButton(
                                                          constraints:
                                                              const BoxConstraints(),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          iconSize: 20,
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
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  ),
                                );
                              },
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

          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}
