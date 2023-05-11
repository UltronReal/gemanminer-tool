// Developed by UltronPrivatDevelopments
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() {
  final apiKey = 'api-key-here';
  print('⁕ GermanMiner API ⁕\n');
  print('Welcher Request soll ausgeführt werden?');
  print('1. Bank Transaction');
  print('2. Verfügbare Konten abrufen');
  print('3. Kontoauszug abrufen');
  print('4. Kontoinformationen abrufen');
  print('5. Lagerbestand eines Geschäfts abrufen');

  final input = stdin.readLineSync();

  if (input == '1') {
    final accountNumber = _readLine('⁕ Bitte geben Sie Ihre Kontonummer ein:');
    final targetAccountNumber = _readLine('⁕ Bitte geben Sie die Ziel-Kontonummer ein:');
    final amount = _readLine('⁕ Bitte geben Sie den Betrag ein:');
    final message = _readLine('⁕ Bitte geben Sie eine Nachricht ein:');

    final apiUrl = _buildApiUrl(
        'https://api.germanminer.de/v2/bank/transaction', apiKey,
        accountNumber: accountNumber,
        targetAccountNumber: targetAccountNumber,
        amount: amount,
        message: message);

    _makeApiRequest(apiUrl);
  } else if (input == '2') {
    final apiUrl = _buildApiUrl('https://api.germanminer.de/v2/bank/list', apiKey);
    _makeApiRequest(apiUrl);
  } else if (input == '3') {
    final accountNumber = _readLine('⁕ Bitte geben Sie Ihre Kontonummer ein:');
    final page = _readLine('⁕ Bitte geben Sie die Seite ein:');

    final apiUrl = _buildApiUrl(
        'https://api.germanminer.de/v2/bank/activitystatement', apiKey,
        accountNumber: accountNumber,
        page: page);

    _makeApiRequest(apiUrl);
  } else if (input == '4') {
    final accountNumber = _readLine('⁕ Bitte geben Sie Ihre Kontonummer ein:');

    final apiUrl = _buildApiUrl(
        'https://api.germanminer.de/v2/bank/info', apiKey,
        accountNumber: accountNumber);

    _makeApiRequest(apiUrl);
  } else if (input == '5') {
    final bizId = _readLine('⁕ Bitte geben Sie die ID des Geschäfts ein:');

    final apiUrl = _buildApiUrl(
        'https://api.germanminer.de/v2/biz/info', apiKey,
        bizId: bizId);

    _makeApiRequest(apiUrl);
  } else {
    print('Ungültige Eingabe.');
  }
}

String _readLine(String message) {
  print(message);
  final input = stdin.readLineSync();
  return input ?? '';
}

String _buildApiUrl(String baseUrl, String apiKey,
    {String accountNumber = '',
    String targetAccountNumber = '',
    String amount = '',
    String message = '',
    String page = '',
    String bizId = ''}) {
  final queryParams = {
    'key': apiKey,
    'accountNumber': accountNumber,
    'targetAccountNumber': targetAccountNumber,
    'amount': amount,
    'message': message,
    'page': page,
    'bizId': bizId,
  };
  
  return '$baseUrl?${_encodeQueryParams(queryParams)}';
}

Future<void> _makeApiRequest(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final encoder = JsonEncoder.withIndent('  ');
      final prettyPrint = encoder.convert(jsonResponse);
      print('API response:\n$prettyPrint');
    } else {
      print('API request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('API request failed with exception: $e');
  }
}

String _encodeQueryParams(Map<String, String> params) {
  return params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&');
}
