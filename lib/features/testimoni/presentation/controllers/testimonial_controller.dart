import 'package:flutter/material.dart';

import '../../domain/entities/testimonial_entity.dart';
import '../../domain/usecases/get_testimonials.dart';

class TestimonialController extends ChangeNotifier {

  final GetTestimonials getTestimonials;

  TestimonialController(this.getTestimonials);

  List<TestimonialEntity> testimonials = [];

  Future<void> load() async {

    testimonials = await getTestimonials();

    notifyListeners();
  }
}