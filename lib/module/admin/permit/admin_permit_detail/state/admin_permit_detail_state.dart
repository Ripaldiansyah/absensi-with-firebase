
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_permit_detail_state.freezed.dart';

@unfreezed
class AdminPermitDetailState with _$AdminPermitDetailState {
  factory AdminPermitDetailState({
    @Default(0) int counter,
  }) = _AdminPermitDetailState;
}
    
    