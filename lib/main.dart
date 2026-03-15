import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BriMoHome(),
      debugShowCheckedModeBanner: false,
    ));

class BriMoHome extends StatelessWidget {
  const BriMoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER BIRU ---
            Container(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
              decoration: BoxDecoration(
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
                      Text(
                        "Hai, Imroatun Aina", // Nama kamu sudah benar
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.notifications_none, color: Colors.white),
                          SizedBox(width: 15),
                          Icon(Icons.help_outline, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // KARTU SALDO
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF003D75),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Saldo Rekening Utama", style: TextStyle(color: Colors.white70)),
                            Icon(Icons.visibility_off, color: Colors.white, size: 18),
                          ],
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Rp ••••••••", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        Divider(color: Colors.white24, height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("Cari Fitur", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            // --- GRID MENU 4 KOLOM ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                children: [
                  _menuItem(Icons.account_balance_wallet, "Top Up", Colors.green),
                  _menuItem(Icons.receipt_long, "Tagihan", Colors.teal),
                  _menuItem(Icons.atm, "Setor Tarik", Colors.blue),
                  _menuItem(Icons.shopping_bag, "Lifestyle", Colors.pink),
                  _menuItem(Icons.qr_code_scanner, "QRIS", Colors.blue),
                  _menuItem(Icons.credit_card, "Debit Virtual", Colors.blue),
                  _menuItem(Icons.menu_book, "Catatan", Colors.orange),
                  _menuItem(Icons.trending_up, "Investasi", Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET UNTUK ICON MENU
  Widget _menuItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 11), textAlign: TextAlign.center),
      ],
    );
  }
}
