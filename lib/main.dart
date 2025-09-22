import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Profil Saya"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage("assets"), 
                ),
                const SizedBox(height: 16),
                const Text(
                  "Ahmad Fauzan Ramadhan",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Universitas Mulawarman",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Hobi: Dengar musik",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                // Deskripsi Diri
                const Text(
                  "Tentang Saya",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Saya tinggal di Mangkupalas, Samarinda Seberang. "
                  "Saat ini berusia 19 tahun dan lahir pada 29 Oktober 2005. "
                  "Saya adalah seorang pelajar yang bersemangat belajar hal baru, "
                  "khususnya di bidang teknologi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                // Soft Skill Section
                const Text(
                  "Soft Skill",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  children: const [
                    HoverSkill(text: "Komunikasi"),
                    HoverSkill(text: "Kerja Sama"),
                    HoverSkill(text: "Problem Solving"),
                    HoverSkill(text: "Manajemen Waktu"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoverSkill extends StatefulWidget {
  final String text;
  const HoverSkill({super.key, required this.text});

  @override
  State<HoverSkill> createState() => _HoverSkillState();
}

class _HoverSkillState extends State<HoverSkill> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isHovered ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: isHovered
              ? [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))]
              : [],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isHovered ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
