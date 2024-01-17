
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Sprawdź, czy ciąg znaków zawiera @', () {
    // Przykładowe dane wejściowe
    String email1 = 'user@example.com';
    String email2 = 'anotheruser';

    // Oczekuje, że ciąg znaków z symbolem @ zwróci true
    expect(containsAtSymbol(email1), true);

    // Oczekuje, że ciąg znaków bez symbolu @ zwróci false
    expect(containsAtSymbol(email2), false);
  });
}

bool containsAtSymbol(String input) {
  return input.contains('@');
}