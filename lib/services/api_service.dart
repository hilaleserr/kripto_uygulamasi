import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://api.coingecko.com/api/v3/coins/markets";

  Future<List<dynamic>> fetchCryptos() async {
    final response = await http.get(Uri.parse('$apiUrl?vs_currency=usd'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Kripto para verisi alınamadı');
    }
  }
}
