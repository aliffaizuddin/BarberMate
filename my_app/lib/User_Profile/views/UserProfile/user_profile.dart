import 'package:flutter/material.dart';
import '../../UserProfile/edit_profile.dart';
import '../../models/user_details.dart';
import '../../services/UserProfile/userprofile_memory_impl.dart';
import '../../services/UserProfile/userprofile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserProfileService _userService;
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    _userService =
        UserProfileMemoryImpl(); // You can change the implementation here if needed.
    userProfile = await _userService.getUserProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (userProfile == null) {
      // Display loading indicator or handle the case when user profile is not loaded yet.
      return CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    userProfile: userProfile,
                    updateProfile: updateProfile,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(userProfile.profilePicture),
          ),
          const SizedBox(height: 20),
          Text(
            'Name: ${userProfile.name}',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Barber/Customer: ${userProfile.role}',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Location: ${userProfile.location}',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < userProfile.starRating; i++)
                Icon(Icons.star, color: Colors.yellow),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Phone Number: ${userProfile.phoneNumber}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  void updateProfile(UserProfile updatedProfile) {
    _userService.updateUserProfile(updatedProfile);
    setState(() {
      userProfile = updatedProfile;
    });
  }
}
