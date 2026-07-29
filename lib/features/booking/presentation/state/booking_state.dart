import '../../../../core/state/data_state.dart';

class BookingState {
  final DataStatus status;

  const BookingState({this.status = DataStatus.initial});
}
