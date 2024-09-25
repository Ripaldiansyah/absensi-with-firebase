import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_state.freezed.dart';

@unfreezed
class ReportState with _$ReportState {
  factory ReportState({
    @Default(null) bool? isMonthly,
    @Default(null) String? monthYear,
  }) = _ReportState;
}
