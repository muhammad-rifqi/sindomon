import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../pages/pangaturan.dart';
import '../pages/dashboard.dart';
import '../pages/report.dart';
import '../pages/add_inventaris_page.dart';

class InventarisPage extends StatefulWidget {
  const InventarisPage({super.key});

  @override
  State<InventarisPage> createState() => _InventarisPageState();
}

class _InventarisPageState extends State<InventarisPage> {
  final List<Map<String, dynamic>> listinventaris = [
    {
      "foto": "",
      "nama": "APC Anoa-2 6x6",
      "kategori": "Rantis",
      "kondisi": "Baik",
    },
    {
      "foto": "",
      "nama": "APC Anoa-2 6x6",
      "kategori": "Rantis",
      "kondisi": "Baik",
    },
    {
      "foto": "",
      "nama": "APC Anoa-2 6x6",
      "kategori": "Rantis",
      "kondisi": "Baik",
    },
    {
      "foto": "",
      "nama": "APC Anoa-2 6x6",
      "kategori": "Rantis",
      "kondisi": "Baik",
    },
    {
      "foto": "",
      "nama": "APC Anoa-2 6x6",
      "kategori": "Rantis",
      "kondisi": "Baik",
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
                          menu(Icons.document_scanner, "Inventaris", selected: true),
                          menu(Icons.people_alt, "Organisasi"),
                          menu(Icons.list, "Satwa"),
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
                            "Manajemen Daftar Inventaris",
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
                                  builder: (context) => const AddInventarisPage(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Tambah Inventaris"),
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
                            hintText: "Cari Inventaris...",
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
                                          DataColumn(label: Text("Foto Fisik")),
                                          DataColumn(
                                            label: Text("Nama Asset"),
                                          ),
                                          DataColumn(label: Text("Kategori")),
                                          DataColumn(label: Text("Kondisi")),
                                          DataColumn(label: Text("AKSI")),
                                        ],
                                        rows:
                                            listinventaris.map((e) {
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            4,
                                                          ),
                                                      child: Image.asset(
                                                        "assets/images/rantis.jpg",
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(e["nama"]),
                                                  ),
                                                  DataCell(Text(e["kategori"])),
                                                  DataCell(Text(e["kondisi"])),
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
