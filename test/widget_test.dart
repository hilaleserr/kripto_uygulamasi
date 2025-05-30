import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kripto_takip_uygulamasi/main.dart';  // Proje adınızı doğru yazın

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Uygulamayı oluştur ve bir çerçeve tetikle.
    await tester.pumpWidget(const MyApp()); // const anahtar kelimesi eklendi

    // Sayaç başlangıçta 0 olmalı.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // '+' ikonuna tıkla ve bir çerçeve tetikle.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Sayaç 1'e artmış olmalı.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Sayaç tekrar arttığında 2'yi kontrol et.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
  });
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('0')),
      ),
    );
  }
}
