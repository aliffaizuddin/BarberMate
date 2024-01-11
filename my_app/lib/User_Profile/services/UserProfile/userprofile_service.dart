import '../../models/user_details.dart';

abstract class UserProfileService {
  Future<UserProfile> getUserProfile() {
    // Implement this method based on your data source (e.g., network, database).
    throw UnimplementedError();
  }

  void updateUserProfile(UserProfile updatedProfile) async{
    // Implement this method to update the user profile (e.g., network, database).
    throw UnimplementedError();
  }
}
