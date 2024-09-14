
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_response_sick_detail_state.freezed.dart';

@unfreezed
class AdminResponseSickDetailState with _$AdminResponseSickDetailState {
  factory AdminResponseSickDetailState({
    @Default(0) int counter,
  }) = _AdminResponseSickDetailState;
}
    
    