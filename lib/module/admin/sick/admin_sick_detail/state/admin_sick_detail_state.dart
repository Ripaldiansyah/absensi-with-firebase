
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_sick_detail_state.freezed.dart';

@unfreezed
class AdminSickDetailState with _$AdminSickDetailState {
  factory AdminSickDetailState({
    @Default(0) int counter,
  }) = _AdminSickDetailState;
}
    
    