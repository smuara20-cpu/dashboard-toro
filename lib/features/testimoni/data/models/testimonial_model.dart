import '../../domain/entities/testimonial_entity.dart';

class TestimonialModel extends TestimonialEntity {
  const TestimonialModel({
    required super.name,
    required super.city,
    required super.packageName,
    required super.image,
    required super.review,
    required super.rating,
    required super.photos,
  });
}