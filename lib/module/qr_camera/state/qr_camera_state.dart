
import 'package:freezed_annotation/freezed_annotation.dart';
part 'qr_camera_state.freezed.dart';

@unfreezed
class QrCameraState with _$QrCameraState {
  factory QrCameraState({
    @Default(0) int counter,
  }) = _QrCameraState;
}
    
    