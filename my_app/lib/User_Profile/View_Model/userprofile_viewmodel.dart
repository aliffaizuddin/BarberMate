import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Booking/services/user/user_service_memory_impl.dart';
import '../Services/UserProfile/userprofile_memory_impl.dart';
import '../models/user_details.dart';

class UserProfileViewModel extends Viewmodel {
  late UserProfile _userProfile;
  final UserProfileMemoryImpl _userProfileMemoryImpl =
      UserProfileMemoryImpl(UserServiceMemoryImpl());

  UserProfileViewModel() {
    _userProfile = UserProfile(
      name: '',
      role: '',
      location: '',
      starRating: 0,
      phoneNumber: '',
      profilePicture: '',
    );
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    // Use the service to get the user profile
    _userProfile = await _userProfileMemoryImpl.getUserProfile();
    notifyListeners();
  }

  UserProfile get userProfile => _userProfile;

  Future<void> updateProfile(UserProfile updatedProfile) async {
    // Use the service to update the user profile
    await _userProfileMemoryImpl.updateUserProfile(updatedProfile);

    // Update the local profile immediately without reloading from the service
    _userProfile = updatedProfile;

    // Notify listeners after updating the local profile
    notifyListeners();
  }
}
