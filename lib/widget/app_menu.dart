import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMenu extends StatefulWidget {
  final String selectedMenu;
  final Function(String) onTap;

  const AppMenu({super.key, required this.selectedMenu, required this.onTap});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  String roleID = "";

  @override
  void initState() {
    super.initState();
    getRoleID();
  }

  Future<void> getRoleID() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      roleID = prefs.getString('roleid_login') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        // ROLE 1
        if (roleID == "1") ...[
          menu(Icons.dashboard_rounded, "Dashboard"),

          treeMenu(
            icon: Icons.admin_panel_settings_rounded,
            title: "Keamanan",
            children: [
              menu(Icons.manage_accounts_rounded, "Pengguna"),
              menu(Icons.devices_rounded, "Perangkat"),
            ],
          ),

          treeMenu(
            icon: Icons.dataset_rounded,
            title: "Data",
            children: [
              menu(Icons.account_balance_rounded, "Polda"),
              menu(Icons.location_city_rounded, "Polres"),
              menu(Icons.devices_other_rounded, "Perangkat"),
              menu(Icons.badge_rounded, "Jabatan"),
              menu(Icons.local_police_rounded, "Kat_Senjata"),
              menu(Icons.tune_rounded, "Kaliber"),
            ],
          ),

          menu(Icons.description_rounded, "Laporan"),
          // menu(Icons.manage_accounts_rounded, "Pengguna"),
          // menu(Icons.settings_rounded, "Pengaturan"),
          menu(Icons.logout_rounded, "Logout"),
        ],

        // ROLE 2 & 3
        if (roleID == "2" || roleID == "3") ...[
          menu(Icons.dashboard_rounded, "Dashboard"),

          treeMenu(
            icon: Icons.groups_rounded,
            title: "Master SDM",
            children: [
              menu(Icons.apartment_rounded, "Organisasi"),
              menu(Icons.badge_rounded, "Personel"),
              menu(Icons.gavel_rounded, "Hukum"),
            ],
          ),

          treeMenu(
            icon: Icons.inventory_2_rounded,
            title: "Logistik Assets",
            children: [
              menu(Icons.security_rounded, "Senjata"),
              menu(Icons.scatter_plot_rounded, "Amunisi"),
              menu(Icons.precision_manufacturing_rounded, "Sapras"),
              menu(Icons.pets_rounded, "Satwa"),
            ],
          ),

          treeMenu(
            icon: Icons.folder_shared_rounded,
            title: "Administrasi DMS",
            children: [
              menu(Icons.inbox_rounded, "Kotak Masuk"),
              menu(Icons.outbox_rounded, "Kotak Keluar"),
            ],
          ),

          treeMenu(
            icon: Icons.shield_rounded,
            title: "Operasional & Kamtibmas",
            children: [menu(Icons.campaign_rounded, "Sitkamtibmas")],
          ),

          treeMenu(
            icon: Icons.wifi_tethering_rounded,
            title: "Komunikasi Taktis",
            children: [
              menu(Icons.call_rounded, "Voip"),
              menu(Icons.video_call_rounded, "Konferensi"),
            ],
          ),

          treeMenu(
            icon: Icons.hub_rounded,
            title: "Informasi Terpadu",
            children: [
              menu(Icons.local_library_rounded, "Perpustakaan Digital"),
              menu(Icons.feedback_rounded, "Pengaduan Masyarakat"),
            ],
          ),

          treeMenu(
            icon: Icons.phone_android_rounded,
            title: "Menu Mobile",
            children: [
              menu(Icons.my_location_rounded, "Patroli GPS"),
              menu(Icons.report_problem_rounded, "Pengaduan Masyarakat"),
            ],
          ),

          // menu(Icons.map_rounded, "Wilayah"),
          menu(Icons.logout_rounded, "Logout"),
        ],
      ],
    );
  }

  Widget treeMenu({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.white70),

      title: Text(title, style: const TextStyle(color: Colors.white)),

      collapsedIconColor: Colors.white,
      iconColor: Colors.white,

      children: children,
    );
  }

  Widget menu(IconData icon, String title, {bool? selected}) {
    final isSelected = selected ?? widget.selectedMenu == title;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        decoration: BoxDecoration(
          color: isSelected ? Colors.amber : Colors.transparent,

          borderRadius: BorderRadius.circular(14),
        ),

        child: ListTile(
          leading: Icon(
            icon,

            color: isSelected ? Colors.black : Colors.white70,
          ),

          title: Text(
            title,

            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,

              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),

          trailing:
              isSelected
                  ? const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.black,
                  )
                  : null,

          onTap: () {
            widget.onTap(title);
          },
        ),
      ),
    );
  }
}
