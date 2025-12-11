import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_frontend/main.dart';

void main() {
  testWidgets('Tic Tac Toe renders and shows title', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    expect(find.text('Tic Tac Toe'), findsOneWidget);
  });

  testWidgets('Grid has 9 cells', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    await tester.pumpAndSettle();

    // Count 9 cells by checking expected semantics labels for each cell index.
    int count = 0;
    for (int i = 1; i <= 9; i++) {
      final empty = find.bySemanticsLabel('Cell $i, empty').evaluate().isNotEmpty;
      final x = find.bySemanticsLabel('Cell $i, X').evaluate().isNotEmpty;
      final o = find.bySemanticsLabel('Cell $i, O').evaluate().isNotEmpty;
      if (empty || x || o) {
        count++;
      }
    }
    expect(count, 9);
  });

  testWidgets('Restart button exists', (WidgetTester tester) async {
    await tester.pumpWidget(const TicTacToeApp());
    expect(find.text('Restart'), findsOneWidget);
  });
}
