import 'dart:ui';

class LudoPiece{
  int id;
  String colorName;
  Offset offset;

  LudoPiece({
    required this.id,
    required this.colorName,
    required this.offset,
  });

  LudoPiece copyWith({
    int? id,
    String? colorName,
    Offset? offset,
  }) {
    return LudoPiece(
      id: id ?? this.id,
      colorName: colorName ?? this.colorName,
      offset: offset ?? this.offset,
    );
  }
}