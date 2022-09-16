part of 'indicator_bloc.dart';

enum ProgressIndicatorStatus {
  initial,
  success,
  failed,
  emptyList,
}

@immutable
class ProgressIndicatorState extends Equatable {
  const ProgressIndicatorState({
    this.status = ProgressIndicatorStatus.initial,
    this.progressIndicator = const [],
  });
  final ProgressIndicatorStatus status;
  final List progressIndicator;

  ProgressIndicatorState copyWith({
    ProgressIndicatorStatus? status,
    List? progressIndicator,
  }) {
    return ProgressIndicatorState(
      status: status ?? this.status,
      progressIndicator: progressIndicator ?? this.progressIndicator,
    );
  }

  @override
  List<Object?> get props => [
        progressIndicator,
      ];
}
