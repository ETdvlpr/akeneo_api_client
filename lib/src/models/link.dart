/// Represents a collection of hyperlinks for navigation.
///
/// This class includes references to self, first, next, previous, and
/// documentation URLs related to the API response.
class Links {
  final UrlReference? self;
  final UrlReference? first;
  final UrlReference? next;
  final UrlReference? previous;
  final UrlReference? documentation;
  final UrlReference? download;

  const Links({
    this.self,
    this.first,
    this.next,
    this.previous,
    this.documentation,
    this.download,
  });

  /// Creates an instance of [Links] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] == null
          ? null
          : UrlReference.fromJson(json['self'] as Map<String, dynamic>),
      first: json['first'] == null
          ? null
          : UrlReference.fromJson(json['first'] as Map<String, dynamic>),
      next: json['next'] == null
          ? null
          : UrlReference.fromJson(json['next'] as Map<String, dynamic>),
      previous: json['previous'] == null
          ? null
          : UrlReference.fromJson(json['previous'] as Map<String, dynamic>),
      documentation: json['documentation'] == null
          ? null
          : UrlReference.fromJson(
              json['documentation'] as Map<String, dynamic>),
      download: json['download'] == null
          ? null
          : UrlReference.fromJson(json['download'] as Map<String, dynamic>),
    );
  }

  /// Converts this [Links] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'self': self?.toJson(),
      'first': first?.toJson(),
      'next': next?.toJson(),
      'previous': previous?.toJson(),
      'documentation': documentation?.toJson(),
      'download': download?.toJson(),
    };
  }

  /// Creates a copy of this [Links] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Links copyWith({
    UrlReference? self,
    UrlReference? first,
    UrlReference? next,
    UrlReference? previous,
    UrlReference? documentation,
    UrlReference? download,
  }) {
    return Links(
      self: self ?? this.self,
      first: first ?? this.first,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      documentation: documentation ?? this.documentation,
      download: download ?? this.download,
    );
  }
}

/// Represents a hyperlink URL reference.
///
/// This class contains the URL (href) of a hyperlink reference.
class UrlReference {
  final String href;

  const UrlReference({
    required this.href,
  });

  /// Creates an instance of [UrlReference] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory UrlReference.fromJson(Map<String, dynamic> json) {
    return UrlReference(
      href: json['href'] as String,
    );
  }

  /// Converts this [UrlReference] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }

  /// Creates a copy of this [UrlReference] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  UrlReference copyWith({
    String? href,
  }) {
    return UrlReference(
      href: href ?? this.href,
    );
  }
}
