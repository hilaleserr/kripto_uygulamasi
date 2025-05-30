import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController(); // Kullanıcı adı controller'ı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Arka planı siyah yapıyoruz
      appBar: AppBar(
        title: Text('Profil', style: TextStyle(color: Colors.white)), // AppBar'ı beyaz yapıyoruz
        backgroundColor: Colors.black, // AppBar'ı siyah yapıyoruz
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Geri ok simgesi beyaz
          onPressed: () {
            Navigator.pop(context); // Geri gitme işlemi
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kullanıcı adı yazma alanı
            Text(
              'Kullanıcı Adı:',
              style: TextStyle(color: Colors.white, fontSize: 18), // Başlık beyaz
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Kullanıcı adınızı girin',
                hintStyle: TextStyle(color: Colors.grey), // Placeholder rengi gri
                filled: true,
                fillColor: Colors.white10, // Arka plan rengini hafif gri yapıyoruz
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Kenar çizgisi beyaz
                ),
              ),
              style: TextStyle(color: Colors.white), // Yazı rengini beyaz yapıyoruz
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kullanıcı adı kaydetme işlemi yapılabilir
                print('Kullanıcı adı: ${_usernameController.text}');
              },
              child: Text('Kaydet', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Buton rengini mavi yapıyoruz
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
