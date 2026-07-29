import '../entities/testimonial_entity.dart';
import '../repository/testimonial_repository.dart';

class GetTestimonials {
  final TestimonialRepository repository;

  GetTestimonials(this.repository);

  Future<List<TestimonialEntity>> call() {
    return repository.getTestimonials();
  }
}
