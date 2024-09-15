
import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin_qr_generator_state.freezed.dart';

@unfreezed
class AdminQrGeneratorState with _$AdminQrGeneratorState {
  factory AdminQrGeneratorState({
    @Default(0) int counter,
  }) = _AdminQrGeneratorState;
}
    
    