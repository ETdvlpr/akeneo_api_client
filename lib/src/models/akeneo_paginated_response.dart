import 'link.dart';

/// Represents a paginated response from the Akeneo API.
///
/// This class contains information about the links, current page number,
/// item count, and embedded items within the response.
class AkeneoPaginatedResponse {
  final Links links;
  final int currentPage;
  final int? itemCount;
  final Embedded embedded;

  const AkeneoPaginatedResponse({
    required this.links,
    required this.currentPage,
    this.itemCount,
    required this.embedded,
  });

  /// Creates an instance of [AkeneoPaginatedResponse] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory AkeneoPaginatedResponse.fromJson(Map<String, dynamic> json) {
    return AkeneoPaginatedResponse(
      links: Links.fromJson(json['_links'] as Map<String, dynamic>),
      currentPage: json['current_page'] as int,
      itemCount: json['items_count'] as int?,
      embedded: Embedded.fromJson(json['_embedded'] as Map<String, dynamic>),
    );
  }

  /// Converts this [AkeneoPaginatedResponse] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      '_links': links.toJson(),
      'current_page': currentPage,
      'items_count': itemCount,
      '_embedded': embedded.toJson(),
    };
  }

  /// Creates a copy of this [AkeneoPaginatedResponse] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  AkeneoPaginatedResponse copyWith({
    Links? links,
    int? currentPage,
    int? itemCount,
    Embedded? embedded,
  }) {
    return AkeneoPaginatedResponse(
      links: links ?? this.links,
      currentPage: currentPage ?? this.currentPage,
      itemCount: itemCount ?? this.itemCount,
      embedded: embedded ?? this.embedded,
    );
  }
}

/// Represents embedded items within a paginated response.
///
/// This class holds a list of dynamic items embedded within the response.
class Embedded {
  final List<dynamic> items;

  Embedded({
    required this.items,
  });

  /// Creates an instance of [Embedded] from a JSON [Map].
  ///
  /// This method is useful for deserializing JSON objects into Dart objects.
  factory Embedded.fromJson(Map<String, dynamic> json) {
    return Embedded(
      items: List<dynamic>.from(json['items']),
    );
  }

  /// Converts this [Embedded] instance to a JSON [Map].
  ///
  /// This method is useful for serializing Dart objects into JSON objects.
  Map<String, dynamic> toJson() {
    return {
      'items': List<dynamic>.from(items),
    };
  }

  /// Creates a copy of this [Embedded] instance with the specified fields modified.
  ///
  /// This method is useful for creating a new instance with updated values.
  Embedded copyWith({
    List<dynamic>? items,
  }) {
    return Embedded(
      items: items ?? this.items,
    );
  }
}
