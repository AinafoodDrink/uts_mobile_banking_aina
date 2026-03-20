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
                height: 220,
                decoration: const BoxDecoration(
                  color: Color(0xFF01529C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
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
                      decoration: BoxDecoration(
                        color: const Color(0xFF003D75),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 10)],
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
                          const Divider(color: Colors.white24, height: 25),
                          // SEKARANG MENU INI BISA DIKLIK
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _quickMenu(context, Icons.swap_horiz, "Transfer", const TransferPage()),
                              _quickMenu(context, Icons.qr_code_2, "BRIVA", const BrivaPage()),
                              _quickMenu(context, Icons.account_balance_wallet, "E-Wallet", const EWalletPage()),
                              _quickMenu(context, Icons.phone_android, "Pulsa/Data", const PulsaPage()),
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
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenu(context, Icons.account_balance_wallet, "Top Up", Colors.green, const TopUpPage()),
                _buildMenu(context, Icons.receipt_long, "Tagihan", Colors.teal, const TagihanPage()),
                _buildMenu(context, Icons.atm, "Setor Tarik", Colors.blue, const SetorTarikPage()),
                _buildMenu(context, Icons.shopping_bag, "Lifestyle", Colors.pink, const LifestylePage()),
                _buildMenu(context, Icons.qr_code_scanner, "QRIS", Colors.blue, const QrisPage()),
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

  // FUNGSI QUICK MENU YANG SUDAH DIBERI NAVIGASI
  Widget _quickMenu(BuildContext context, IconData icon, String label, Widget destination) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 11), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// --- HALAMAN-HALAMAN TUJUAN ---
class AkunPage extends StatelessWidget {
  const AkunPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Akun"), backgroundColor: const Color(0xFF01529C)),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Center(child: CircleAvatar(radius: 50, backgroundColor: Colors.blueGrey, child: Icon(Icons.person, size: 50, color: Colors.white))),
          const SizedBox(height: 10),
          const Text("Imroatun Aina", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("NPM: 20241220036", style: TextStyle(color: Colors.grey)),
          const Divider(height: 50),
          const ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Keluar", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}

class AktivitasPage extends StatelessWidget {
  const AktivitasPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Aktivitas"), backgroundColor: const Color(0xFF01529C)), body: const Center(child: Text("Belum ada aktivitas terbaru")));
}

class MutasiPage extends StatelessWidget {
  const MutasiPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Mutasi"), backgroundColor: const Color(0xFF01529C)), body: const Center(child: Text("Riwayat Transaksi Kosong")));
}

// Fitur Quick Menu
class TransferPage extends StatelessWidget { const TransferPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Transfer")), body: const Center(child: Text("Halaman Transfer"))); }
class BrivaPage extends StatelessWidget { const BrivaPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("BRIVA")), body: const Center(child: Text("Halaman BRIVA"))); }
class EWalletPage extends StatelessWidget { const EWalletPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("E-Wallet")), body: const Center(child: Text("Halaman E-Wallet"))); }
class PulsaPage extends StatelessWidget { const PulsaPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Pulsa/Data")), body: const Center(child: Text("Halaman Pulsa/Data"))); }

// Fitur Grid Menu
class TopUpPage extends StatelessWidget { const TopUpPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Top Up")), body: const Center(child: Text("Halaman Top Up"))); }
class TagihanPage extends StatelessWidget { const TagihanPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Tagihan")), body: const Center(child: Text("Halaman Tagihan"))); }
class QrisPage extends StatelessWidget { const QrisPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("QRIS")), body: const Center(child: Text("Scan QRIS"))); }
class SetorTarikPage extends StatelessWidget { const SetorTarikPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Setor Tarik")), body: const Center(child: Text("Halaman Setor Tarik"))); }
class LifestylePage extends StatelessWidget { const LifestylePage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Lifestyle")), body: const Center(child: Text("Halaman Lifestyle"))); }
class DebitPage extends StatelessWidget { const DebitPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Debit")), body: const Center(child: Text("Halaman Debit"))); }
class CatatanPage extends StatelessWidget { const CatatanPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Catatan")), body: const Center(child: Text("Halaman Catatan"))); }
class InvestasiPage extends StatelessWidget { const InvestasiPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Investasi")), body: const Center(child: Text("Halaman Investasi"))); }
