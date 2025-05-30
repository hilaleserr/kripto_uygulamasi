import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  List<dynamic> favoriteCoins = []; // Favorilere eklenen coin'lerin listesi
  ScrollController _scrollController = ScrollController(); // Scroll controller ekledik

  // Kripto para verilerini çekme fonksiyonu
  Future<List<dynamic>> fetchCryptoData() async {
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Veri çekilemedi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Arka planı siyah yapıyoruz
      appBar: AppBar(
        title: Text(
          'Kripto Paralar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Başlık rengini ve fontunu iyileştiriyoruz
        ),
        backgroundColor: Colors.black, // AppBar'ı siyah yapıyoruz
        actions: [
          // Favoriler ikonu
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites', arguments: favoriteCoins); // Favoriler ekranına yönlendir
            },
          ),
          // Profil ikonu
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white), // Profil ikonu
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Profil ekranına yönlendir
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCryptoData(), // API verisi çekiliyor
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Yükleniyor animasyonu
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}', style: TextStyle(color: Colors.white))); // Hata mesajı beyaz
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Veri bulunamadı', style: TextStyle(color: Colors.white))); // Veri bulunamadı mesajı beyaz
          } else {
            final cryptoList = snapshot.data!;
            return Scrollbar(
              controller: _scrollController, // ScrollController'ı burada bağlıyoruz
              thumbVisibility: true, // Kaydırma çubuğunu her zaman görünür yapıyoruz
              child: Theme(
                data: ThemeData(
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all<Color>(Colors.blue), // Kaydırma çubuğunun rengini mavi yapıyoruz
                  ),
                ),
                child: ListView.builder(
                  controller: _scrollController, // Listeyi kaydırabilmek için controller ekledik
                  itemCount: cryptoList.length,
                  itemBuilder: (context, index) {
                    final coin = cryptoList[index];
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
                            favoriteCoins.contains(coin) ? Icons.favorite : Icons.favorite_border,
                            color: favoriteCoins.contains(coin) ? Colors.red : Colors.white, // Kalp simgesi kırmızı olacak
                          ),
                          onPressed: () {
                            setState(() {
                              if (favoriteCoins.contains(coin)) {
                                favoriteCoins.remove(coin); // Coin favorilerden çıkar
                              } else {
                                favoriteCoins.add(coin); // Coin favorilere ekle
                              }
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
