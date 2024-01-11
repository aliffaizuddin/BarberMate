import 'package:flutter/material.dart';
import '../models/user_details.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Imtiaaz Syaqib';
  String role = 'Barber/Customer';
  String location = 'KTDI, UTM';
  int starRating = 5;
  String phoneNumber = '(60) 132-282635';

  @override
  Widget build(BuildContext context) {
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
                    userProfile: UserProfile(
                      name: name,
                      role: role,
                      location: location,
                      starRating: starRating,
                      phoneNumber: phoneNumber,
                      profilePicture: '../lib/assets/profile_picture.jpg',
                    ),
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
            backgroundImage: AssetImage('../lib/assets/profile_picture.jpg'),
          ),
          const SizedBox(height: 20),
          Text(
            'Name: $name',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Barber/Customer: $role',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Location: $location',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < starRating; i++)
                Icon(Icons.star, color: Colors.yellow),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Phone Number: $phoneNumber',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  void updateProfile(UserProfile newProfile) {
    setState(() {
      name = newProfile.name;
      role = newProfile.role;
      location = newProfile.location;
      starRating = newProfile.starRating;
      phoneNumber = newProfile.phoneNumber;
    });
  }
}
