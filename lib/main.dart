import 'package:flutter/material.dart';

void main() {
  runApp(const JobsdayApp());
}

class JobsdayApp extends StatelessWidget {
  const JobsdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOBSDAY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Deep Navy
        primaryColor: const Color(0xFFF59E0B), // Warm Gold
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF59E0B),
          secondary: Color(0xFF10B981), // Emerald
          surface: Color(0xFF1E293B),
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Fisioterapi & Peregangan HNP',
      'time': '09:00 - 10:00 (Jam Fokus)',
      'badge': '⚡ Energi Tinggi',
      'color': const Color(0xFFF59E0B),
    },
    {
      'title': 'Belajar Bahasa Inggris (Vocab & Listening)',
      'time': '10:30 - 11:30',
      'badge': '🧠 Fokus Sedang',
      'color': const Color(0xFF10B981),
    },
    {
      'title': 'Membaca Panduan Dasar Python',
      'time': '14:00 - 15:00',
      'badge': '🍵 Energi Ringan',
      'color': const Color(0xFF3B82F6),
    },
  ];

  void _triggerEmergencyReschedule() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: const Text('Mode Darurat Aktif', style: TextStyle(color: Color(0xFFF59E0B))),
        content: const Text(
          'AI JOBSDAY menggeser sisa kegiatan hari ini ke slot waktu istirahat agar Anda fokus pada pemulihan fisik.',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Color(0xFF10B981))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.wb_sunny, color: Color(0xFFF59E0B)),
            SizedBox(width: 8),
            Text('JOBSDAY', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Recovery Mode',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Briefing Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF3B82F6)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, color: Color(0xFF3B82F6), size: 18),
                      SizedBox(width: 8),
                      Text('AI Daily Briefing', style: TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Selamat pagi! Hari ini fokus utama Anda adalah Fisioterapi HNP di jam fokus pagi (09:00). Tugas lainnya sudah disesuaikan dengan tingkat energi Anda.',
                    style: TextStyle(fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Peringatan Sosmed
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Peringatan Sosmed: Anda sudah 45 menit di Instagram. Istirahat sejenak untuk menjaga postur tubuh Anda.',
                      style: TextStyle(fontSize: 12, color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Shortcuts Search AI
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.smart_toy, color: Color(0xFF3B82F6), size: 18),
                    label: const Text('Gemini', style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.bolt, color: Color(0xFF10B981), size: 18),
                    label: const Text('ChatGPT', style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Section Header & Emergency Reschedule Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jadwal Hari Ini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFF59E0B)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _triggerEmergencyReschedule,
                  icon: const Icon(Icons.refresh, color: Color(0xFFF59E0B), size: 14),
                  label: const Text('Atur Ulang Darurat', style: TextStyle(color: Color(0xFFF59E0B), fontSize: 11)),
                )
              ],
            ),
            const SizedBox(height: 10),

            // Task List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Card(
                  color: const Color(0xFF1E293B),
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: task['color'], width: 1.5),
                  ),
                  child: ListTile(
                    title: Text(task['title'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    subtitle: Text(task['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(task['badge'], style: const TextStyle(fontSize: 10, color: Colors.white70)),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: const Color(0xFFF59E0B),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBar His(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Evaluasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
