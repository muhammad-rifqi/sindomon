import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../pages/pangaturan.dart';
import '../pages/dashboard.dart';
import '../pages/report.dart';
import '../pages/add_senjata.dart';

class SenjataPage extends StatefulWidget {
  const SenjataPage({super.key});

  @override
  State<SenjataPage> createState() => _SenjataPageState();
}

class _SenjataPageState extends State<SenjataPage> {
  final List<Map<String, dynamic>> senjataapi = [
    {
      "foto_unit": "",
      "no_seri": "1111234567",
      "kategori": "Senjata",
      "tahun": 2023,
    },
    {
      "foto_unit": "",
      "no_seri": "1111234567",
      "kategori": "Senjata",
      "tahun": 2023,
    },
    {
      "foto_unit": "",
      "no_seri": "1111234567",
      "kategori": "Senjata",
      "tahun": 2023,
    },
    {
      "foto_unit": "",
      "no_seri": "1111234567",
      "kategori": "Senjata",
      "tahun": 2023,
    },
    {
      "foto_unit": "",
      "no_seri": "1111234567",
      "kategori": "Senjata",
      "tahun": 2023,
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
                          menu(Icons.list, "Senjata Api", selected: true),
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
                            "Manajemen Senjata Api",
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
                                  builder: (context) => const AddSenjataPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Tambah Senjata"),
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
                            hintText: "Cari Senjata...",
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
                                    DataColumn(label: Text("Foto Unit")),

                                    DataColumn(label: Text("No Seri")),

                                    DataColumn(label: Text("Kategori")),

                                    DataColumn(label: Text("Tahun")),

                                    DataColumn(label: Text("AKSI")),
                                  ],
                                  rows:
                                      senjataapi
                                          .map(
                                            (e) => DataRow(
                                              cells: [
                                                DataCell(
                                                  Image.asset(
                                                    "assets/images/pistol.png",
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                                DataCell(Text(e["no_seri"])),

                                                DataCell(Text(e["kategori"])),

                                                DataCell(Text("${e["tahun"]}")),

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

          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}
