import 'dart:convert';

import '../../data/models/course.dart';

///Course Repository
class CourseRepository {
  CourseRepository._();
   static final CourseRepository _instance = CourseRepository._();

  ///To access the repo quickly
  static CourseRepository get instance => _instance;

  
  /// Asynchronously retrieves a list of courses after simulating a network delay.
  Future<List<Course>> get() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final response = jsonEncode([
      {
        'title':
            'Certificate in Word Processing & Data Entry Console Operation',
        'progress': 60,
        'premium': true,
        'live': true,
        'averageRating': 4.5,
        'totalRatings': 80,
        'image':
            'https://img.freepik.com/premium-psd/school-education-admission-youtube-thumbnail-web-banner-template_475351-410.jpg?w=826',
        'tags': [
          'Premium',
          'Live',
        ]
      },
      {
        'title': 'Bachelors of Commerce with Bachelor of Commerce',
        'progress': 20,
        'premium': false,
        'live': false,
        'averageRating': 4,
        'totalRatings': 20,
        'image':
            'https://cdn.upgraddisha.com/Blogs/d-Online%20BCom%20Admission%20Course%20Details%2C%20Eligibility%20Criteria%20%26%20Fee.jpg',
        'tags': [
          'Premium',
          'Live',
        ]
      }
    ]);
    return (jsonDecode(response) as List)
        .map((data) => Course.fromJson(data))
        .toList();
  }
}
