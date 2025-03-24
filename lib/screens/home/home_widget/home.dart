import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'profile.dart';
import 'video/video_recording.dart'; // تأكد من استيراد VideoRecordingScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  bool _isDarkMode = false; // إدارة الثيم يدويًا

  final List<Widget> _pages = [
    const VideoScreen(),
    const MainHomeScreen(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(), // تطبيق الثيم
      home: Scaffold(
        body: _pages[_selectedIndex],
        // تمت إزالة BottomNavigationBar
      ),
    );
  }
}

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logotext.png", height: 40),
        backgroundColor: Colors.green.shade800, // لون أخضر داكن
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/video'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade800, // لون أخضر داكن
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'بدء تسجيل الفيديو',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; // التحقق من الثيم

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/logotext.png", height: 40),
        backgroundColor: Colors.green.shade800, // لون أخضر داكن
        actions: [
          // زر الملف الشخصي
          IconButton(
            icon: const Icon(LucideIcons.user, size: 35, color: Colors.white),
            onPressed: () {
              // الانتقال إلى صفحة الملف الشخصي
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // عرض الصورة في منتصف الشاشة
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/VVV.png', // مسار الصورة
                fit: BoxFit.cover, // تغطية المساحة المتاحة
              ),
            ),
          ),
          // زر تحليل لغة الإشارة
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildFeatureButton(
              icon: LucideIcons.video,
              label: 'تحليل لغة الإشارة',
              onPressed: () {
                // الانتقال إلى صفحة تسجيل الفيديو
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VideoRecordingScreen()),
                );
              },
              isDarkMode: isDarkMode,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isDarkMode,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor:
            isDarkMode ? Colors.green.shade900 : Colors.green.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.green.shade800),
          const SizedBox(width: 15),
          Text(label,
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.green.shade800,
              )),
        ],
      ),
    );
  }
}
