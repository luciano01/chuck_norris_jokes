import '../../domain/domain.dart';

class JokeModel extends JokeEntity {
  const JokeModel({
    required List<dynamic> categories,
    required String createdAt,
    required String iconUrl,
    required String id,
    required String updatedAt,
    required String url,
    required String value,
  }) : super(
          categories: categories,
          createdAt: createdAt,
          iconUrl: iconUrl,
          id: id,
          updatedAt: updatedAt,
          url: url,
          value: value,
        );

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      categories: List<String>.from(map['categories'] ?? []),
      createdAt: map['created_at'] ?? '',
      iconUrl: map['icon_url'] ?? '',
      id: map['id'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      url: map['url'] ?? '',
      value: map['value'] ?? '',
    );
  }
}
