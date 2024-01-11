// user_service.dart

import '../../models/user.dart';

abstract class UserServiceCustomer {
  Future<User> getUserById(String id); // Add parameter here
  Future<List<User>> getAllUser();
  Future<void> addUser(User user);
}
