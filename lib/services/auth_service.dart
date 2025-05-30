import 'package:flutter/material.dart';

class AuthService {
  // Giriş işlemi yapan metod
  Future<void> login(String email, String password, BuildContext context) async {
    try {
      // Burada API üzerinden giriş doğrulaması yapabilirsiniz
      // Örneğin, kullanıcıyı doğrulama işlemi
      Navigator.pushReplacementNamed(context, '/currency');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Giriş başarısız')));
    }
  }

  // Kayıt olma işlemi yapan metod
  Future<void> signup(String email, String password, BuildContext context) async {
    try {
      // Burada API üzerinden kullanıcı kayıt işlemi yapılabilir
      // Örneğin, kullanıcıyı kaydetme işlemi
      Navigator.pushReplacementNamed(context, '/currency');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kayıt başarısız')));
    }
  }
}
