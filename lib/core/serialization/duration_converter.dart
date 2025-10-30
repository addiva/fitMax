import 'package:freezed_annotation/freezed_annotation.dart';

class DurationSecondsConverter extends JsonConverter<Duration?, int?> {
  const DurationSecondsConverter();

  @override
  Duration? fromJson(int? json) =>
      json == null ? null : Duration(seconds: json);

  @override
  int? toJson(Duration? object) => object?.inSeconds;
}
