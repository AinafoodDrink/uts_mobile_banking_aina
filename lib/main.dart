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

// --- ISI HALAMAN-HALAMAN DETAIL ---

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transfer"), backgroundColor: const Color(0xFF01529C)),
      body: ListView(
        children: const [
          ListTile(leading: CircleAvatar(child: Text("B")), title: Text("Bank BRI"), subtitle: Text("Transfer sesama BRI")),
          ListTile(leading: CircleAvatar(backgroundColor: Colors.orange, child: Text("M")), title: Text("Bank Mandiri"), subtitle: Text("Transfer antar bank")),
          ListTile(leading: CircleAvatar(backgroundColor: Colors.blue, child: Text("B")), title: Text("Bank BCA"), subtitle: Text("Transfer antar bank")),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Tambah Penerima Baru"),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFF01529C),
      ),
    );
  }
}

class BrivaPage extends StatelessWidget {
  const BrivaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BRIVA"), backgroundColor: const Color(0xFF01529C)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Masukkan Nomor Virtual Account", border: OutlineInputBorder())),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Lanjutkan"), style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}

class PulsaPage extends StatelessWidget {
  const PulsaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pulsa/Data"), backgroundColor: const Color(0xFF01529C)),
      body: GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        childAspectRatio: 2,
        children: [
          Card(child: Center(child: Text("Pulsa 10rb\nRp 11.500", textAlign: TextAlign.center))),
          Card(child: Center(child: Text("Pulsa 20rb\nRp 21.500", textAlign: TextAlign.center))),
          Card(child: Center(child: Text("Kuota 5GB\nRp 45.000", textAlign: TextAlign.center))),
          Card(child: Center(child: Text("Kuota 10GB\nRp 80.000", textAlign: TextAlign.center))),
        ],
      ),
    );
  }
}

// Tambahkan sisa class AkunPage, MutasiPage, dll dari kode sebelumnya...
class AkunPage extends StatelessWidget {
  const AkunPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Akun"), backgroundColor: const Color(0xFF01529C)),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Center(child: CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50))),
          const SizedBox(height: 10),
          const Text("Imroatun Aina", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("NPM: 20241220036"),
          const Divider(height: 50),
          const ListTile(leading: Icon(Icons.settings), title: Text("Pengaturan Keamanan")),
          const ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Keluar", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}

class MutasiPage extends StatelessWidget {
  const MutasiPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Mutasi")), body: const Center(child: Text("Belum ada riwayat transaksi.")));
}

class AktivitasPage extends StatelessWidget {
  const AktivitasPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Aktivitas")), body: const Center(child: Text("Login Terakhir: 20-03-2026")));
}

class EWalletPage extends StatelessWidget { const EWalletPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("E-Wallet")), body: ListView(children: const [ListTile(title: Text("GoPay")), ListTile(title: Text("OVO")), ListTile(title: Text("DANA"))])); }
class TopUpPage extends StatelessWidget { const TopUpPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Top Up")), body: const Center(child: Text("Halaman Top Up"))); }
class TagihanPage extends StatelessWidget { const TagihanPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Tagihan")), body: const Center(child: Text("Halaman Tagihan"))); }
class QrisPage extends StatelessWidget { const QrisPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("QRIS")), body: const Center(child: Icon(Icons.qr_code_scanner, size: 100))); }
class SetorTarikPage extends StatelessWidget { const SetorTarikPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Setor Tarik")), body: const Center(child: Text("Pilih ATM Terdekat"))); }
class LifestylePage extends StatelessWidget { const LifestylePage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Lifestyle")), body: const Center(child: Text("Voucher Game & Hiburan"))); }
class DebitPage extends StatelessWidget { const DebitPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Debit")), body: const Center(child: Text("Manajemen Kartu"))); }
class CatatanPage extends StatelessWidget { const CatatanPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Catatan")), body: const Center(child: Text("Catatan Pengeluaran"))); }
class InvestasiPage extends StatelessWidget { const InvestasiPage({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text("Investasi")), body: const Center(child: Text("Emas & Reksa Dana"))); }
