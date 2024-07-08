
import 'dart:convert';

import '../../data/models/offer.dart';

/// Offer Repository
class OfferRepository {
  OfferRepository._();

    static final OfferRepository _instance = OfferRepository._();

  ///To access the repo quickly
  static OfferRepository get instance => _instance;

    /// Retrieves a list of [OfferModel] objects from an API.
    ///
    /// This function simulates a network delay of 2 seconds before making the API call.
    /// It then encodes a JSON response containing a list of offer objects with their respective title, description, image, and discount.
    /// The function decodes the JSON response and maps each data object to an [OfferModel] using the [OfferModel.fromJson] constructor.
    /// Finally, it returns the list of [OfferModel] objects.
    ///
    /// Returns a [Future] that completes with a [List] of [OfferModel] objects.
 Future<List<OfferModel>> get() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final response = jsonEncode([
      {
       'title': 'Welcome to the world of Unlimited Learning',
        'description': '10% off on all courses',
        'image': 'https://img.freepik.com/premium-photo/schoolgirl-points-your-advertisement-yellow-isolated-background-additional-training-courses-schoolchildren-happy-little-girl-points-ad_222185-4964.jpg',
        'discount': 50.0
      },
      {
        'title': '10% off on all courses',
        'description': '10% off on all courses',
        'image': 'https://www.startupindia.gov.in/content/dam/invest-india/Resources/LandD/onlineCoursesBanner.png/_jcr_content/renditions/cq5dam.web.1280.1280.png',
        'discount': 10.0
      }
    ]);
    return (jsonDecode(response) as List)
        .map((data) => OfferModel.fromJson(data))
        .toList();
  }
}
