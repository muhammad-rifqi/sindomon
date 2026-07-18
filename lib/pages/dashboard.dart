import 'package:flutter/material.dart';
import '../widget/background.dart';
import '../pages/pangaturan.dart';
import '../pages/user_page.dart';
import '../pages/report.dart';
import '../pages/satwa.dart';
import '../pages/senjata.dart';
import '../pages/personel.dart';
import '../pages/inventaris.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                width: 260,
                decoration: const BoxDecoration(
                  color: Color(0xff1E1B4B),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 35),

                    /// Logo
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      child: const Icon(
                        Icons.security,
                        color: Colors.amber,
                        size: 38,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "SINDOMON",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "Management Inventaris",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        children: [
                          menu(
                            Icons.dashboard_rounded,
                            "Dashboard",
                            selected: true,
                          ),
                          menu(Icons.description_rounded, "Laporan"),
                          menu(Icons.map_rounded, "Wilayah"),
                          menu(Icons.inventory_2_rounded, "Inventaris"),
                          menu(Icons.groups_rounded, "Organisasi"),
                          menu(Icons.pets_rounded, "Satwa"),
                          menu(Icons.gavel_rounded, "Senjata Api"),
                          menu(Icons.category_rounded, "Kategori Senjata"),
                          menu(Icons.move_to_inbox_rounded, "Kotak Masuk"),
                          menu(Icons.outbox_rounded, "Kotak Keluar"),
                          menu(Icons.badge_rounded, "Personel"),
                          menu(Icons.inventory_rounded, "Stok Amunisi"),
                          menu(Icons.memory_rounded, "Perangkat"),
                          menu(Icons.people_alt_rounded, "Pengguna"),
                        ],
                      ),
                    ),

                    const Divider(
                      color: Colors.white24,
                      indent: 20,
                      endIndent: 20,
                    ),

                    menu(Icons.settings_rounded, "Pengaturan"),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              /// ========================
              /// CONTENT
              /// ========================
              Expanded(
                child: Stack(
                  children: [
                    /// Background Map
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/background.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// Overlay agar sedikit gelap
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withValues(alpha: 0.20),
                      ),
                    ),

                    /// Logo + Judul
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.shield,
                            color: Colors.amber,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "SINDOMON - NATIONAL COMMAND CENTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                DateTime.now().toString(),
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// KPI Kanan Atas
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        width: 240,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.cyanAccent),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Personel",
                              style: TextStyle(color: Colors.white70),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "153,500",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(
                              "Defense Equipment",
                              style: TextStyle(color: Colors.white70),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "97%",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 15),

                            Text(
                              "Vacant Position",
                              style: TextStyle(color: Colors.white70),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "218",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Panel kiri bawah
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Container(
                        width: 250,
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView(
                          children: const [
                            Text(
                              "Sitkamtibmas Reports",
                              style: TextStyle(color: Colors.white),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "• Laporan 1\n"
                              "• Laporan 2\n"
                              "• Laporan 3\n"
                              "• Laporan 4\n"
                              "• Laporan 5",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// KPI bawah tengah
                    Positioned(
                      bottom: 20,
                      left: 300,
                      child: Row(
                        children: [
                          _kpiCard("Active Fleet", "300"),

                          const SizedBox(width: 20),

                          _kpiCard("K9 Standby", "140"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu(IconData icon, String title, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: selected ? Colors.amber : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          leading: Icon(icon, color: selected ? Colors.black : Colors.white70),
          title: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: selected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          trailing:
              selected
                  ? const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.black,
                  )
                  : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          hoverColor: Colors.white10,
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

              case "Senjata":
                page = const SenjataPage();
                break;

              case "Satwa":
                page = const SatwaPage();
                break;

              case "Personel":
                page = const PersonelPage();
                break;

              case "Inventaris":
                page = const InventarisPage();
                break;

              case "Pengguna":
                page = const UserPage();
                break;

              default:
                page = const DashboardPage();
            }

            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          },
        ),
      ),
    );
  }

  Widget _kpiCard(String title, String value) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
