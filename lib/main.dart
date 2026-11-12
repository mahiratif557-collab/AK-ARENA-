import 'package:flutter/material.dart';

void main() => runApp(AKArenaApp());

class AKArenaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AK ARENA',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int diamonds = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("AK ARENA", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        actions: [Chip(label: Text("💎 \$diamonds")), SizedBox(width: 10)],
      ),
      body: _index == 0 ? homeBody() : _index == 1 ? walletBody() : storeBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
        ],
      ),
    );
  }

  Widget homeBody() {
    return ListView(padding: EdgeInsets.all(12), children: [
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.15), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange)),
        child: Text("⚡ Live Tournaments\nFree Fire Only - Join & Win", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      SizedBox(height: 12),
      card("Free Fire Solo", "Entry Rs 100", "Prize Rs 1000"),
      card("Free Fire Duo", "Entry Rs 200", "Prize Rs 2000"),
      card("Free Fire Squad", "Entry Rs 400", "Prize Rs 4000"),
    ]);
  }

  Widget card(String t, String e, String p) {
    return Card(color: Color(0xFF1A1A1A), child: ListTile(
      leading: Icon(Icons.sports_esports, color: Colors.orange, size: 40),
      title: Text(t, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("\$e • \$p"),
      trailing: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("\$t Joined!")));
      }, child: Text("Join")),
    ));
  }

  Widget walletBody() => Center(child: Text("💎 Diamonds: \$diamonds\n\nPayment: Easypaisa Only", textAlign: TextAlign.center, style: TextStyle(fontSize: 20)));
  Widget storeBody() => ListView(padding: EdgeInsets.all(12), children: [
    ListTile(title: Text("35 Diamonds"), subtitle: Text("Rs 100"), trailing: ElevatedButton(onPressed: (){}, child: Text("Buy"))),
    ListTile(title: Text("70 Diamonds"), subtitle: Text("Rs 200"), trailing: ElevatedButton(onPressed: (){}, child: Text("Buy"))),
    ListTile(title: Text("140 Diamonds"), subtitle: Text("Rs 400"), trailing: ElevatedButton(onPressed: (){}, child: Text("Buy"))),
  ]);
}
