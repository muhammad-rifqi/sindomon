import 'package:flutter/material.dart';
import '../widget/textfield.dart';
import '../pages/dashboard.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/mascot_login.jpg", width: 80),

          const SizedBox(height: 12),

          const Text(
            "SINDOMON - Portal Masuk",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 25),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Username / NRP",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),

          const SizedBox(height: 6),

          const AppTextField(hint: "input_username"),

          const SizedBox(height: 15),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kata Sandi",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),

          const SizedBox(height: 6),

          const AppTextField(hint: "input_password", obscure: true),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF6B300),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: const Text(
                "Masuk ke Sistem",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
