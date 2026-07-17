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
                          menu(Icons.dashboard, "Dashboard", selected: true),
                          menu(Icons.description, "Laporan"),
                          menu(Icons.map, "Wilayah"),
                          menu(Icons.document_scanner, "Inventaris"),
                          menu(Icons.people_alt, "Organisasi"),
                          menu(Icons.list, "Satwa"),
                          menu(Icons.list, "Senjata"),
                          menu(Icons.list, "Kategori"),
                          menu(Icons.inbox, "Inbox"),
                          menu(Icons.outbox, "Outbox"),
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
          color: Colors.black.withValues(alpha: 0.20)
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
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            )
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
            border: Border.all(
              color: Colors.cyanAccent,
            ),
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
                style: TextStyle(
                  color: Colors.white70,
                ),
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

            _kpiCard(
              "Active Fleet",
              "300",
            ),

            const SizedBox(width: 20),

            _kpiCard(
              "K9 Standby",
              "140",
            ),

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

        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),

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
