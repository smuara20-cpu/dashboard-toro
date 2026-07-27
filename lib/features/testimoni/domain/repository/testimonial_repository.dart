import '../entities/testimonial_entity.dart';

abstract class TestimonialRepository {
  Future<List<TestimonialEntity>> getTestimonials();
}