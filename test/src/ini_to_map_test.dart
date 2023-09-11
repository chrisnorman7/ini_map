import 'package:ini_map/ini_map.dart';
import 'package:test/test.dart';

void main() {
  group(
    'iniToMap',
    () {
      test(
        'Invalid section name',
        () {
          const ini = "this = won't work.";
          expect(() => iniToMap(ini), throwsA(isA<NoSectionName>()));
        },
      );

      test(
        'Valid option',
        () {
          const ini = '[section_name]\n'
              'this = works';
          final m = iniToMap(ini);
          expect(m.length, 1);
          expect(m.keys.first, 'section_name');
          final section = m['section_name']!;
          expect(section.length, 1);
          expect(section['this'], 'works');
        },
      );

      test(
        'Multiple options',
        () {
          const ini = '[section_name]\n'
              'hello = world\n'
              'this = works';
          final m = iniToMap(ini);
          expect(m.length, 1);
          final section = m['section_name']!;
          expect(section.length, 2);
          expect(section['hello'], 'world');
          expect(section['this'], 'works');
        },
      );

      test(
        'Multiple sections',
        () {
          const ini = '[section1]\n'
              'option1 = 1\n'
              'option2 = 2\n\n'
              '[section2]\n'
              'option3 = 3\n'
              'option4 = 4\n';
          final m = iniToMap(ini);
          expect(m.length, 2);
          final section1 = m['section1']!;
          expect(section1.length, 2);
          expect(section1['option1'], '1');
          expect(section1['option2'], '2');
          final section2 = m['section2']!;
          expect(section2.length, 2);
          expect(section2['option3'], '3');
          expect(section2['option4'], '4');
        },
      );
    },
  );
}
