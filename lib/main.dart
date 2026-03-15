import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: BriMoHome()));

class BriMoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BRImo Initial")),
      body: Center(child: Text("Proyek Dimulai")),
    );
  }
}
