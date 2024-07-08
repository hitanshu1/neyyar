

import 'dart:convert';

import '../../data/models/category.dart';

///Category Repository
class CategoryRepository {
   CategoryRepository._();

    static final CategoryRepository _instance = CategoryRepository._();

  ///To access the repo quickly
  static CategoryRepository get instance => _instance;


    /// Retrieves a list of categories after simulating a network delay.
    ///
    /// This function sends a request to the server to retrieve a list of categories.
    /// It waits for 2 seconds using `Future.delayed` to simulate a network delay.
    /// Then it encodes a JSON array of category objects into a string using `jsonEncode`.
    /// The encoded string is then decoded into a list of maps using `jsonDecode`.
    /// Each map in the list is converted into a `Category` object using `Category.fromJson`.
    /// Finally, the list of `Category` objects is returned.
    ///
    /// Returns a `Future` that resolves to a `List<Category>`.
  Future<List<Category>> get({int? type}) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    if(type==1){
       final response = jsonEncode([
      {'name': 'Banking'},
      {'name': "IT & Software's"},
      {'name':'Entrance'}
    ]);
    return (jsonDecode(response) as List)
        .map((data) => Category.fromJson(data))
        .toList();
    }
    
    final response = jsonEncode([
     
       {'name': 'Competitive Exam'},
      {'name': 'Kerala PSC'},
    ]);
    return (jsonDecode(response) as List)
        .map((data) => Category.fromJson(data))
        .toList();
  }

}
