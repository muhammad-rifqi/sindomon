import 'package:flutter/material.dart';
import '../widget/textfield.dart';
import '../pages/dashboard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("https://sindomon.yoknusantara.com/api/v1/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "password": passwordController.text,
        }),
      );

      debugPrint(response.statusCode.toString());
      debugPrint(response.body);

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Kalau API mengembalikan token
        String token = data["jwt_token"];

        debugPrint(token);

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (_) => const DashboardPage()),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login gagal: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Terjadi kesalahan: $e")));
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
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

          AppTextField(hint: "input_username", controller: usernameController),

          const SizedBox(height: 15),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kata Sandi",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),

          const SizedBox(height: 6),

          AppTextField(
            hint: "input_password",
            controller: passwordController,
            obscure: true,
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: isLoading ? null : login,

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
