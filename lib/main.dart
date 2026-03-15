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

  // DAFTAR HALAMAN NAVIGASI BAWAH (Semuanya sudah ada isinya sekarang)
  final List<Widget> _children = [
    const HomeContent(), 
    const MutasiPage(),
    const AktivitasPage(),
    const AkunPage(), // SEKARANG AKUN SUDAH AKTIF
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
          // HEADER
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
                        Text("NPM: 20241220036", style: TextStyle(color: Colors.white70, fontSize: 12)),
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
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Saldo Utama", style: TextStyle(color: Colors.white70)), Icon(Icons.visibility_off, color: Colors.white, size: 18)]),
                      const SizedBox(height: 5),
                      const Align(alignment: Alignment.centerLeft, child: Text("Rp ••••••••", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // GRID MENU (Memanggil class fitur asli kamu)
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenu(context, Icons.account_balance_wallet, "Top Up", Colors.green, const TopUpPage()),
                _buildMenu(context, Icons.receipt_long, "Tagihan", Colors.teal, const TagihanPage()),
                _buildMenu(context, Icons.qr_code_scanner, "QRIS", Colors.blue, const QrisPage()),
                _buildMenu(context, Icons.atm, "Setor Tarik", Colors.blue, const SetorTarikPage()),
                _buildMenu(context, Icons.shopping_bag, "Lifestyle", Colors.pink, const LifestylePage()),
                _buildMenu(context, Icons.credit_card, "Debit", Colors.blue, const DebitPage()),
                _buildMenu(context, Icons.menu_book, "Catatan", Colors.orange, const CatatanPage()),
                _buildMenu(context, Icons.trending_up, "Investasi", Colors.orange, const InvestasiPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, IconData icon, String label, Color color, Widget destination) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

// --- HALAMAN AKUN (YANG BARU) ---
class AkunPage extends StatelessWidget {
  const AkunPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Akun"), backgroundColor: const Color(0xFF01529C)),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Center(
            child: CircleAvatar(radius: 50, backgroundColor: Colors.blueGrey, child: Icon(Icons.person, size: 50, color: Colors.white)),
          ),
          const SizedBox(height: 10),
          const Text("Imroatun Aina", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("NPM: 20241220036", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          const Divider(),
          const ListTile(leading: Icon(Icons.settings), title: Text("Pengaturan Akun")),
          const ListTile(leading: Icon(Icons.help_outline), title: Text("Pusat Bantuan")),
          const ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Keluar", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}

// --- HALAMAN AKTIVITAS ---
class AktivitasPage extends StatelessWidget {
  const AktivitasPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aktivitas"), backgroundColor: const Color(0xFF01529C)),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          Text("Terbaru", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Card(child: ListTile(leading: Icon(Icons.login, color: Colors.blue), title: Text("Login Berhasil"), subtitle: Text("Baru saja"))),
        ],
      ),
    );
  }
}

// --- FITUR-FITUR ASLI KAMU (TIDAK BERUBAH) ---
class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Top Up"), backgroundColor: const Color(0xFF01529C)),
    body: const Center(child: Text("Isi Top Up: GoPay, OVO, Dana")),
  );
}

class TagihanPage extends StatelessWidget {
  const TagihanPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Tagihan"), backgroundColor: const Color(0xFF01529C)),
    body: const ListTile(leading: Icon(Icons.flash_on), title: Text("PLN Pascabayar")),
  );
}

class QrisPage extends StatelessWidget {
  const QrisPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(backgroundColor: Colors.black, body: const Center(child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 100)));
}

class SetorTarikPage extends StatelessWidget {
  const SetorTarikPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Setor Tarik"), backgroundColor: const Color(0xFF01529C)), body: const Center(child: Text("Tarik Tunai")));
}

class LifestylePage extends StatelessWidget {
  const LifestylePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Lifestyle"), backgroundColor: const Color(0xFF01529C)), body: const Center(child: Text("Voucher Game")));
}

class DebitPage extends StatelessWidget {
  const DebitPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Kartu Debit"), backgroundColor: const Color(0xFF01529C)),
    body: Center(child: Container(width: 300, height: 180, decoration: BoxDecoration(color: Colors.blue[900], borderRadius: BorderRadius.circular(15)), child: const Center(child: Text("GPN DEBIT", style: TextStyle(color: Colors.white))))),
  );
}

class CatatanPage extends StatelessWidget {
  const CatatanPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Catatan"), backgroundColor: const Color(0xFF01529C)), body: const Center(child: Text("Riwayat Belanja")));
}

class InvestasiPage extends StatelessWidget {
  const InvestasiPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Investasi"), backgroundColor: const Color(0xFF01529C)), body: const Center(child: Text("Beli Emas")));
}

class MutasiPage extends StatelessWidget {
  const MutasiPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mutasi"), backgroundColor: const Color(0xFF01529C)),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.arrow_downward, color: Colors.green), title: Text("Transfer Masuk"), subtitle: Text("Rp 500.000")),
        ],
      ),
    );
  }
}
