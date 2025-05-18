import 'package:flutter_test/flutter_test.dart';
import 'package:welltrack/main.dart';

void main() {
  testWidgets('Tela inicial mostra a mensagem de boas-vindas', (WidgetTester tester) async {
    await tester.pumpWidget(const WellTrackApp());

    expect(find.text('WellTrack'), findsOneWidget);
  });
}
