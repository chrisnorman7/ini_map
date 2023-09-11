/// The top-level exception class.
class IniMapException implements Exception {
  /// Create an instance.
  const IniMapException(this.message);

  /// The message to show.
  final String message;

  /// Pretty print.
  @override
  String toString() => '$runtimeType: $message';
}

/// There is no section name currently.
class NoSectionName extends IniMapException {
  /// Create an instance.
  const NoSectionName() : super('An option is given outside of a section.');
}

/// An invalid option string was found.
class InvalidOptionString extends IniMapException {
  /// Create an instance.
  const InvalidOptionString({required this.line})
      : super('Invalid option line');

  /// he offending line.
  final String line;

  /// Describe this object.
  @override
  String toString() => '$runtimeType: $message: $line';
}
