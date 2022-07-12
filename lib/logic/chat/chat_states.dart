
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_states.freezed.dart';
@freezed
abstract class ChatState with _$ChatState{
  const factory ChatState.initial() = ChatStateInitial;
    const factory ChatState.error({required String error}) = ChatStateError;

}
// flutter pub run build_runner watch --delete-conflicting-outputs 