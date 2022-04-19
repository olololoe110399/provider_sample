import 'package:freezed_annotation/freezed_annotation.dart';
part 'model.freezed.dart';

@freezed
class Model with _$Model {
  const factory Model({
    @Default('') String name,
    @Default('') String email,
  }) = _Model;
}
