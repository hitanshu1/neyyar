import 'package:get_storage/get_storage.dart';


/// app storage
class AppGetXStorage {
  const AppGetXStorage._();

  /// instance
  static const AppGetXStorage instance = AppGetXStorage._();
/// user profile
  static const userData = 'user_data';
 
  



/// Removes the user data from the storage.
///
/// This function removes the user data from the storage, effectively logging the user out.
///
/// No parameters are required.
///
/// No return value.
   void logout() {
    final box = GetStorage();
    box.remove(userData);
    
  }


  

}
