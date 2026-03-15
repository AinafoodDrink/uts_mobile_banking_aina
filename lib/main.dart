import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BriMoHome(),
      debugShowCheckedModeBanner: false,
    ));

class BriMoHome extends StatefulWidget {
  @override
  _BriMoHomeState createState() => _BriMoHomeState();
}

class _BriMoHomeState extends State<BriMoHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER (Nama & NPM) ---
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              decoration: const BoxDecoration(
                color: Color(0xFF01529C),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Hai, Imroatun Aina", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("NPM: 220101xxxx (UTS Mobile)", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                      const Icon(Icons.notifications_none, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color(0xFF003D75), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Saldo Rekening Utama", style: TextStyle(color: Colors.white70)), Icon(Icons.visibility_off, color: Colors.white, size: 18)]),
                        const SizedBox(height: 5),
                        const Align(alignment: Alignment.centerLeft, child: Text("Rp ••••••••", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                        const Divider(color: Colors.white24, height: 20),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Semua Rekeningmu", style: TextStyle(color: Colors.white)), Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14)]),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- GRID MENU ---
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  _menuItem(context, Icons.account_balance_wallet, "Top Up", Colors.green, TopUpPage()),
                  _menuItem(context, Icons.receipt_long, "Tagihan", Colors.teal, TagihanPage()),
                  _menuItem(context, Icons.qr_code_scanner, "QRIS", Colors.blue, QrisPage()),
                  _menuItem(context, Icons.atm, "Setor Tarik", Colors.blue, SetorTarikPage()),
                  _menuItem(context, Icons.shopping_bag, "Lifestyle", Colors.pink, LifestylePage()),
                  _menuItem(context, Icons.credit_card, "Debit", Colors.blue, DebitPage()),
                  _menuItem(context, Icons.menu_book, "Catatan", Colors.orange, CatatanPage()),
                  _menuItem(context, Icons.trending_up, "Investasi", Colors.orange, InvestasiPage()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF01529C),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Mutasi"),
          BottomNavigationBarItem(icon: Icon(Icons.sync_alt), label: "Aktivitas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String label, Color color, Widget target) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => target)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

// --- 1. TOP UP ---
class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Up"), backgroundColor: const Color(0xFF01529C)),
      body: Center(child: Text("Pilih E-Wallet: GoPay, OVO, Dana, LinkAja")),
    );
  }
}

// --- 2. TAGIHAN ---
class TagihanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tagihan"), backgroundColor: const Color(0xFF01529C)),
      body: ListView(children: const [ListTile(leading: Icon(Icons.flash_on), title: Text("PLN Pascabayar"))]),
    );
  }
}

// --- 3. QRIS ---
class QrisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: Center(child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 100)));
  }
}

// --- 4. SETOR TARIK ---
class SetorTarikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setor Tarik"), backgroundColor: const Color(0xFF01529C)),
      body: Column(children: const [ListTile(leading: Icon(Icons.atm), title: Text("Tarik Tunai"), subtitle: Text("Tanpa Kartu"))]),
    );
  }
}

// --- 5. LIFESTYLE ---
class LifestylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lifestyle"), backgroundColor: const Color(0xFF01529C)),
      body: GridView.count(crossAxisCount: 2, children: const [Card(child: Center(child: Text("Tiket Pesawat"))), Card(child: Center(child: Text("Voucher Game")))]),
    );
  }
}

// --- 6. DEBIT ---
class DebitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kartu Debit"), backgroundColor: const Color(0xFF01529C)),
      body: Center(child: Container(width: 300, height: 180, decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(15)), child: const Center(child: Text("GPN DEBIT", style: TextStyle(color: Colors.white))))),
    );
  }
}

// --- 7. CATATAN ---
class CatatanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catatan Keuangan"), backgroundColor: const Color(0xFF01529C)),
      body: const Center(child: Text("Belum ada riwayat pengeluaran.")),
    );
  }
}

// --- 8. INVESTASI ---
class InvestasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Investasi"), backgroundColor: const Color(0xFF01529C)),
      body: const ListTile(leading: Icon(Icons.trending_up, color: Colors.orange), title: Text("Emas"), subtitle: Text("Mulai investasi dari Rp 10.000")),
    );
  }
}
