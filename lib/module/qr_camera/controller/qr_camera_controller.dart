
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/qr_camera_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class QrCameraController extends Cubit<QrCameraState> implements IBlocBase {
  QrCameraController() : super(QrCameraState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  increment() {
    state.counter++;
    emit(state.copyWith());
  }
}
    
      
    