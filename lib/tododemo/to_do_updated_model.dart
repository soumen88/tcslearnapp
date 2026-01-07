import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_updated_model.freezed.dart';
part 'to_do_updated_model.g.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class ToDoUpdatedModel with _$ToDoUpdatedModel {
  @JsonSerializable(explicitToJson: true)
  const factory ToDoUpdatedModel({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _ToDoUpdatedModel;

  factory ToDoUpdatedModel.fromJson(Map<String, Object?> json) => _$ToDoUpdatedModelFromJson(json);
}
