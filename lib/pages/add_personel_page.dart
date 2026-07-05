import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../widget/form_input_personel.dart';
import '../pages/pangaturan.dart';
import '../pages/dashboard.dart';
import '../pages/user_page.dart';
import '../pages/report.dart';

class AddPersonelPage extends StatefulWidget {
  const AddPersonelPage({super.key});

  @override
  State<AddPersonelPage> createState() => _AddPersonelPageState();
}

class _AddPersonelPageState extends State<AddPersonelPage> {
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Kembali"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: SizedBox(
                          width: 470,
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(25),
                              child: FormTambahPersonel(),
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
          // ScaffoldMessenger.of(
          //   context,
          // ).showSnackBar(const SnackBar(content: Text("ListTile diklik")));

          // showDialog(
          //   context: context,
          //   builder:
          //       (_) => AlertDialog(
          //         title: const Text("Informasi"),
          //         content: Text(title),
          //       ),
          // );
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

          case "Pengguna":
            page = const UserPage();
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
