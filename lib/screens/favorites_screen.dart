import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    // Navigator'dan gelen favori coin'leri alıyoruz
    final List<dynamic> favoriteCoins = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
      backgroundColor: Colors.black, // Arka planı siyah yapıyoruz
      appBar: AppBar(
        title: Text('Favoriler', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Geri ok simgesi beyaz
          onPressed: () {
            Navigator.pop(context); // Geri gitme işlemi
          },
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteCoins.length,
        itemBuilder: (context, index) {
          final coin = favoriteCoins[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Colors.grey[800], // Kartın rengi koyu gri
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Köşeleri yuvarlatıyoruz
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(coin['image'], width: 50, height: 50), // Para görseli
              ),
              title: Text(
                coin['name'],
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600), // Başlık stilini iyileştiriyoruz
              ),
              subtitle: Text(
                '${coin['current_price']} USD',
                style: TextStyle(color: Colors.white, fontSize: 16), // Fiyat yazısı
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete, // Silme ikonu
                  color: Colors.red, // Silme ikonu kırmızı olacak
                ),
                onPressed: () {
                  setState(() {
                    favoriteCoins.removeAt(index); // Favorilerden coin'i silme işlemi
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
