import 'package:flutter/material.dart';
import 'main.dart';
import 'tutorial11-2.dart';
import 'tutorial10_2.dart';
import 'tutorial_10_2_b.dart';

// 2311102246_Annasya Maulafidatu Zahra
class MyApp11_1 extends StatefulWidget {
  const MyApp11_1({super.key});

  @override
  State<MyApp11_1> createState() => _MyApp11_1State();
}

class _MyApp11_1State extends State<MyApp11_1> {
  int selected = 0;
  PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            // Halaman 1 - Home
            Center(
              child: InkWell(
                child: const Text(
                  'Go to Home page',
                  style: TextStyle(fontSize: 30),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
            ),

            // Halaman 2 - Email
            MyApp11_2(),

            // Halaman 3 - Profile (Berisi Tombol ke Data Produk Laravel)
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp12()),
                  );
                },
                child: const Text(
                  'Lihat Data Produk (Tugas 10.2)',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

            // Halaman 4 - Gempa
            ModNetworking(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Email'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_rounded),
            label: 'Gempa',
          ),
        ],
      ),
    );
  }
}
