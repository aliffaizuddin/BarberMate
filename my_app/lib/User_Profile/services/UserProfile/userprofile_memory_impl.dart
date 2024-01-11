import '../../models/user_details.dart';
import 'userprofile_service.dart';

class UserProfileMemoryImpl extends UserProfileService {
  UserProfile _userProfile = UserProfile(
    name: 'Imtiaaz Syaqib',
    role: 'Barber/Customer',
    location: 'KTDI, UTM',
    starRating: 5,
    phoneNumber: '(60) 132-282635',
    profilePicture: 'assets/profile_picture.jpg',
  );

  @override
  Future<UserProfile> getUserProfile() async {
    return _userProfile;
  }

  @override
  void updateUserProfile(UserProfile updatedProfile) async {
    _userProfile = updatedProfile;
  }
}
