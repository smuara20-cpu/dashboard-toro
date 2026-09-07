import '../../domain/entities/jamaah_entity.dart';

enum JamaahStateStatus { initial, loading, success, empty, failure }

class JamaahState {
  final JamaahStateStatus status;
  final List<JamaahEntity> jamaahs;
  final JamaahEntity? selectedJamaah;
  final String? errorMessage;

  const JamaahState({
    this.status = JamaahStateStatus.initial,
    this.jamaahs = const [],
    this.selectedJamaah,
    this.errorMessage,
  });

  JamaahState copyWith({
    JamaahStateStatus? status,
    List<JamaahEntity>? jamaahs,
    JamaahEntity? selectedJamaah,
    bool clearSelectedJamaah = false,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return JamaahState(
      status: status ?? this.status,
      jamaahs: jamaahs ?? this.jamaahs,
      selectedJamaah: clearSelectedJamaah
          ? null
          : selectedJamaah ?? this.selectedJamaah,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoading => status == JamaahStateStatus.loading;

  bool get isSuccess => status == JamaahStateStatus.success;

  bool get isEmpty => status == JamaahStateStatus.empty;

  bool get hasError => status == JamaahStateStatus.failure;
}
