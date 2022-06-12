import 'package:daily_astronomy/core/application_container/daily_astronomy.dart';
import 'package:daily_astronomy/feature/picture_of_day/presentation/screen/nasa_pic_of_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DailyAstronomy', () {
    testWidgets('Should render NasaPicOfDayScreen', (tester) async {
      await tester.pumpWidget(const DailyAstronomy());
      expect(find.byType(NasaPicOfDayScreen), findsOneWidget);
    });
  });
}
