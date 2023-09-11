import '../exceptions.dart';

/// The type of ini maps.
typedef IniMap = Map<String, String>;

/// The regular expression that will match a section name.
final sectionNameRegExp = RegExp(r'^\[([^\]]+)\]$');

/// Convert [ini] to a map.
Map<String, Map<String, String>> iniToMap(
  final String ini, {
  final String commentCharacter = '#',
}) {
  final m = <String, IniMap>{};
  String? sectionName;
  var sectionMap = <String, String>{};
  for (final rawLine in ini.split('\n')) {
    final line = rawLine.replaceAll(r'\r', '').replaceAll(r'\n', '').trimLeft();
    if (line.isEmpty || line.startsWith(commentCharacter)) {
      continue;
    }
    final match = sectionNameRegExp.firstMatch(line);
    if (match == null) {
      if (sectionName == null) {
        throw const NoSectionName();
      }
      final indexOfEquals = line.indexOf('=');
      if (indexOfEquals == -1) {
        throw InvalidOptionString(line: line);
      }
      final optionName = line.substring(0, indexOfEquals).trim();
      final optionValue = line.substring(indexOfEquals + 1).trimLeft();
      sectionMap[optionName] = optionValue;
    } else {
      sectionName = match.group(1);
      sectionMap = {};
      m[sectionName!] = sectionMap;
    }
  }
  return m;
}
