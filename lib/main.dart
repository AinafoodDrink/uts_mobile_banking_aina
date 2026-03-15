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
                  // KARTU SALDO
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

            // --- GRID MENU (Navigasi ke halaman yang berbeda-beda) ---
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
                  _menuItem(context, Icons.atm, "Setor Tarik", Colors.blue, ComingSoonPage(title: "Setor Tarik")),
                  _menuItem(context, Icons.shopping_bag, "Lifestyle", Colors.pink, ComingSoonPage(title: "Lifestyle")),
                  _menuItem(context, Icons.credit_card, "Debit", Colors.blue, ComingSoonPage(title: "Debit")),
                  _menuItem(context, Icons.menu_book, "Catatan", Colors.orange, ComingSoonPage(title: "Catatan")),
                  _menuItem(context, Icons.trending_up, "Investasi", Colors.orange, ComingSoonPage(title: "Investasi")),
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

// ================= HALAMAN 1: TOP UP (KHUSUS) =================
class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top Up"), backgroundColor: const Color(0xFF01529C)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Nominal Top Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10, runSpacing: 10,
              children: ["50.000", "100.000", "200.000", "500.000"].map((val) => 
                Container(
                  width: 150, padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(10)),
                  child: Text("Rp $val", textAlign: TextAlign.center, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                )).toList(),
            ),
            const SizedBox(height: 30),
            const Text("Nomor Handphone", style: TextStyle(fontWeight: FontWeight.bold)),
            const TextField(decoration: InputDecoration(hintText: "Contoh: 0812xxxx")),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN 2: TAGIHAN (KHUSUS) =================
class TagihanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Tagihan"), backgroundColor: const Color(0xFF01529C)),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.flash_on, color: Colors.orange), title: Text("Listrik PLN"), subtitle: Text("ID Pelanggan: 5321xxxx")),
          ListTile(leading: Icon(Icons.water_drop, color: Colors.blue), title: Text("PDAM"), subtitle: Text("Tagihan belum tersedia")),
          ListTile(leading: Icon(Icons.tv, color: Colors.red), title: Text("TV Kabel & Internet"), subtitle: Text("Sudah dibayar")),
        ],
      ),
    );
  }
}

// ================= HALAMAN 3: QRIS (KHUSUS) =================
class QrisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Scan QRIS"), backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 250, height: 250, decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 100)),
            const SizedBox(height: 20),
            const Text("Arahkan kamera ke kode QRIS", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN UMUM (COMING SOON) =================
class ComingSoonPage extends StatelessWidget {
  final String title;
  ComingSoonPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: const Color(0xFF01529C)),
      body: Center(child: Text("Fitur $title akan segera hadir!")),
    );
  }
}
