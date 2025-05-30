import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
        backgroundColor: Colors.black, // AppBar'ın arka plan rengini siyah yapıyoruz
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // E-posta alanı
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  labelStyle: TextStyle(color: Colors.white), // Etiket rengi beyaz
                  filled: true,
                  fillColor: Colors.grey[850], // Arka plan rengi koyu gri
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white), // Yazı rengi beyaz
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-posta boş olamaz';
                  }
                  // E-posta formatı kontrolü
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Geçersiz e-posta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Şifre alanı
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: Colors.white), // Etiket rengi beyaz
                  filled: true,
                  fillColor: Colors.grey[850], // Arka plan rengi koyu gri
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white), // Yazı rengi beyaz
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre boş olamaz';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Giriş Yap Butonu
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _authService.signup(
                      emailController.text,
                      passwordController.text,
                      context,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Buton arka plan rengi mavi
                  foregroundColor: Colors.white, // Buton metin rengi beyaz
                ),
                child: Text('Giriş Yap'),
              ),
              SizedBox(height: 16),
              // Hesap Oluştur Butonu
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Hesap Oluştur',
                  style: TextStyle(color: Colors.blue), // Renk mavi
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black, // Arka plan rengi siyah
    );
  }
}
