import 'package:ini_map/ini_map.dart';
import 'package:test/test.dart';

/// The resulting INI.
const expectedIni =
    '''
[section1]
option1 = 1
option2 = 2

[section2]
option3 = 3
option4 = 4

''';

/// The map to use.
const map = <String, IniMap>{
  'section1': {
    'option1': '1',
    'option2': '2',
  },
  'section2': {
    'option3': '3',
    'option4': '4',
  },
};
void main() {
  group(
    'map_to_ini',
    () {
      test(
        'mapToIni',
        () {
          final ini = mapToIni(map);
          expect(ini, expectedIni);
        },
      );
    },
  );
}
