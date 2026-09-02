import '../../domain/entities/booking_entity.dart';
import '../../domain/repository/booking_repository.dart';
import '../datasource/booking_datasource.dart';
import '../mapper/booking_mapper.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingDataSource dataSource;
  final BookingMapper mapper;

  const BookingRepositoryImpl({required this.dataSource, required this.mapper});

  @override
  Future<List<BookingEntity>> getBookings() async {
    final models = await dataSource.getBookings();

    return models.map(mapper.toEntity).toList(growable: false);
  }

  @override
  Future<BookingEntity?> getBookingById(String id) async {
    final model = await dataSource.getBookingById(id);

    if (model == null) {
      return null;
    }

    return mapper.toEntity(model);
  }

  @override
  Future<BookingEntity> createBooking(BookingEntity booking) async {
    final model = mapper.toModel(booking);

    final createdModel = await dataSource.createBooking(model);

    return mapper.toEntity(createdModel);
  }

  @override
  Future<BookingEntity> updateBooking(BookingEntity booking) async {
    final model = mapper.toModel(booking);

    final updatedModel = await dataSource.updateBooking(model);

    return mapper.toEntity(updatedModel);
  }

  @override
  Future<void> deleteBooking(String id) async {
    await dataSource.deleteBooking(id);
  }
}
