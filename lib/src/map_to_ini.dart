import '../ini_map.dart';

/// Convert [map] to ini.
String mapToIni(final Map<String, IniMap> map) {
  final stringBuffer = StringBuffer();
  for (final entry in map.entries) {
    final key = entry.key;
    stringBuffer.writeln('[$key]');
    final value = entry.value;
    for (final sectionEntry in value.entries) {
      stringBuffer.writeln('${sectionEntry.key} = ${sectionEntry.value}');
    }
    stringBuffer.writeln();
  }
  return stringBuffer.toString();
}
