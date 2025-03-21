import "package:freezed_annotation/freezed_annotation.dart";

part "information_point.g.dart";
part "information_point.freezed.dart";

@freezed
abstract class InformationPoint with _$InformationPoint {
  const factory InformationPoint({required InformationPointTranslations translations}) = _InformationPoint;

  factory InformationPoint.fromJson(Map<String, dynamic> json) => _$InformationPointFromJson(json);
}

@freezed
abstract class InformationPointTranslations with _$InformationPointTranslations {
  const factory InformationPointTranslations({
    @JsonKey(name: "pl") required InformationPointTranslation plTranslation,
  }) = _InformationPointTranslations;

  factory InformationPointTranslations.fromJson(Map<String, dynamic> json) =>
      _$InformationPointTranslationsFromJson(json);
}

@freezed
abstract class InformationPointTranslation with _$InformationPointTranslation {
  const factory InformationPointTranslation({required String location}) = _InformationPointTranslation;

  factory InformationPointTranslation.fromJson(Map<String, dynamic> json) =>
      _$InformationPointTranslationFromJson(json);
}
