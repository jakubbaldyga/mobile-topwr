import "package:freezed_annotation/freezed_annotation.dart";

part "digital_guide_room.freezed.dart";

part "digital_guide_room.g.dart";

@freezed
class DigitalGuideRoom with _$DigitalGuideRoom {
  const factory DigitalGuideRoom({
    required int id,
    required DigitalGuideTranslationsRoom translations,
    @JsonKey(name: "images") required List<int>? imagesIds,
  }) = _DigitalGuideRoom;

  factory DigitalGuideRoom.fromJson(Map<String, dynamic> json) =>
      _$DigitalGuideRoomFromJson(json);
}

@freezed
class DigitalGuideTranslationsRoom with _$DigitalGuideTranslationsRoom {
  const factory DigitalGuideTranslationsRoom({
    required DigitalGuideTranslationRoom pl,
  }) = _DigitalGuideTranslationsRoom;

  factory DigitalGuideTranslationsRoom.fromJson(Map<String, dynamic> json) =>
      _$DigitalGuideTranslationsRoomFromJson(json);
}

@freezed
class DigitalGuideTranslationRoom with _$DigitalGuideTranslationRoom {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DigitalGuideTranslationRoom({
    required String name,
    required String roomPurpose,
    required String location,
    required String workingDaysAndHours,
    required String areEntrancesComment,
    required String isOneLevelFloorComment,
    required String arePlacesForWheelchairsComment,
    required String comment,
  }) = _DigitalGuideTranslationRoom;

  factory DigitalGuideTranslationRoom.fromJson(Map<String, dynamic> json) =>
      _$DigitalGuideTranslationRoomFromJson(json);
}
