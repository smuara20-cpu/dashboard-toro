import 'package:flutter/material.dart';

import '../../data/repository/testimonial_repository_impl.dart';
import '../../domain/usecases/get_testimonials.dart';
import '../controllers/testimonial_controller.dart';
import '../widgets/testimonial_card.dart';
import '../../../../core/utils/google_maps_helper.dart';

class TestimonialPage extends StatefulWidget {
  const TestimonialPage({super.key});

  @override
  State<TestimonialPage> createState() => _TestimonialPageState();
}

class _TestimonialPageState extends State<TestimonialPage> {
  late TestimonialController controller;

  @override
  void initState() {
    super.initState();

    controller = TestimonialController(
      GetTestimonials(TestimonialRepositoryImpl()),
    );

    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Testimoni Jamaah")),

          body: ListView.builder(
            itemCount: controller.testimonials.length,

            itemBuilder: (_, index) {
              return TestimonialCard(item: controller.testimonials[index]);
            },
          ),

          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);

              try {
                await GoogleMapsHelper.openReview();
              } catch (e) {
                scaffoldMessenger.showSnackBar(
                  SnackBar(content: Text('Gagal membuka Google Maps: $e')),
                );
              }
            },
            icon: const Icon(Icons.rate_review),
            label: const Text("Beri Ulasan"),
          ),
        );
      },
    );
  }
}
