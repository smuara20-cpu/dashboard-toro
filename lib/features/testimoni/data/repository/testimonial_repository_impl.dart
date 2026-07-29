import '../../domain/entities/testimonial_entity.dart';
import '../../domain/repository/testimonial_repository.dart';
import '../models/testimonial_model.dart';

class TestimonialRepositoryImpl implements TestimonialRepository {
  @override
  Future<List<TestimonialEntity>> getTestimonials() async {
    return [
      const TestimonialModel(
        name: "Ahmad Fauzi",
        city: "Jakarta",
        packageName: "Umrah Plus Turki",
        image: "",
        review: "Alhamdulillah pelayanan sangat baik.",
        rating: 5,
        photos: 5,
      ),

      const TestimonialModel(
        name: "Nur Aisyah",
        city: "Bandung",
        packageName: "Muslim Tour Jepang",
        image: "",
        review: "Hotel dekat stasiun dan makanan halal mudah ditemukan.",
        rating: 5,
        photos: 3,
      ),

      const TestimonialModel(
        name: "H. Ridwan",
        city: "Surabaya",
        packageName: "Umrah Ramadhan",
        image: "",
        review: "Tour Leader sangat membantu selama perjalanan.",
        rating: 5,
        photos: 7,
      ),
    ];
  }
}
