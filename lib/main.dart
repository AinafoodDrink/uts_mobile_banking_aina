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
            // --- HEADER ---
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              decoration: const BoxDecoration(
                color: Color(0xFF01529C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hai, Imroatun Aina", 
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "NPM: 20241220036", 
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.notifications_none, color: Colors.white),
                          SizedBox(width: 15),
                          Icon(Icons.help_outline, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF003D75),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Saldo Rekening Utama", style: TextStyle(color: Colors.white70)),
                            Icon(Icons.visibility_off, color: Colors.white, size: 18),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Rp •••••••", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        const Divider(color: Colors.white24, height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Semua Rekeningmu", style: TextStyle(color: Colors.white)),
                            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- SEARCH BAR ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari Fitur...",
                  prefixIcon: const Icon(Icons.search, color: Colors.blue),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // --- GRID MENU ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  _menuItem(context, Icons.account_balance_wallet, "Top Up", Colors.green, "Menu Top Up"),
                  _menuItem(context, Icons.receipt_long, "Tagihan", Colors.teal, "Menu Tagihan"),
                  _menuItem(context, Icons.atm, "Setor Tarik", Colors.blue, "Menu Setor Tarik"),
                  _menuItem(context, Icons.shopping_bag, "Lifestyle", Colors.pink, "Menu Lifestyle"),
                  _menuItem(context, Icons.qr_code_scanner, "QRIS", Colors.blue, "Menu QRIS"),
                  _menuItem(context, Icons.credit_card, "Debit", Colors.blue, "Menu Debit"),
                  _menuItem(context, Icons.menu_book, "Catatan", Colors.orange, "Menu Catatan"),
                  _menuItem(context, Icons.trending_up, "Investasi", Colors.orange, "Menu Investasi"),
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text(
                "Aplikasi UTS oleh Imroatun Aina",
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF01529C),
        onTap: (index) {
          setState(() { _currentIndex = index; });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Mutasi"),
          BottomNavigationBarItem(icon: Icon(Icons.sync_alt), label: "Aktivitas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String label, Color color, String info) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: label, icon: icon, detail: info)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String detail;
  const DetailPage({required this.title, required this.icon, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: const Color(0xFF01529C)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(detail, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
