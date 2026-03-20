import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: BriMoHome(),
      debugShowCheckedModeBanner: false,
    ));

class BriMoHome extends StatefulWidget {
  const BriMoHome({super.key});
  @override
  State<BriMoHome> createState() => _BriMoHomeState();
}

class _BriMoHomeState extends State<BriMoHome> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeContent(), 
    const MutasiPage(),
    const AktivitasPage(),
    const AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF01529C),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Mutasi"),
          BottomNavigationBarItem(icon: Icon(Icons.sync_alt), label: "Aktivitas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                decoration: const BoxDecoration(
                  color: Color(0xFF01529C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "BRImo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Hai, Imroatun Aina", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("NPM: 20241220036", style: TextStyle(color: Colors.white70, fontSize: 11)),
                          ],
                        ),
                        const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF003D75),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Saldo Utama", style: TextStyle(color: Colors.white70)),
                              Icon(Icons.visibility_off, color: Colors.white, size: 18)
                            ],
                          ),
                          const Align(
                            alignment: Alignment.centerLeft, 
                            child: Text("Rp ••••••••", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))
                          ),
                          const Divider(color: Colors.white24, height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _quickIcon(Icons.swap_horiz, "Transfer"),
                              _quickIcon(Icons.qr_code_2, "BRIVA"),
                              _quickIcon(Icons.account_balance_wallet, "E-Wallet"),
                              _quickIcon(Icons.phone_android, "Pulsa/Data"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari Fitur",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: [
              _menuIcon(Icons.account_balance_wallet, "Top Up", Colors.green, hasBadge: true),
              _menuIcon(Icons.receipt_long, "Tagihan", Colors.teal, hasBadge: true),
              _menuIcon(Icons.qr_code_scanner, "QRIS", Colors.blue, hasBadge: true),
              _menuIcon(Icons.atm, "Setor Tarik", Colors.blue),
              _menuIcon(Icons.shopping_bag, "Lifestyle", Colors.pink, hasBadge: true),
              _menuIcon(Icons.credit_card, "Debit", Colors.blue, hasBadge: true),
              _menuIcon(Icons.menu_book, "Catatan", Colors.orange),
              _menuIcon(Icons.trending_up, "Investasi", Colors.orange, hasBadge: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 26),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }

  Widget _menuIcon(IconData icon, String label, Color color, {bool hasBadge = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: color, size: 28),
            ),
            if (hasBadge)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center),
      ],
    );
  }
}

// Halaman Dummy agar tidak eror saat diklik
class MutasiPage extends StatelessWidget { const MutasiPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Mutasi"))); }
class AktivitasPage extends StatelessWidget { const AktivitasPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Aktivitas"))); }
class AkunPage extends StatelessWidget { const AkunPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Akun"))); }
