import '../../models/user.dart';
import 'user_service.dart';

class UserServiceMemoryImplCustomer implements UserServiceCustomer {
  final List<User> _users = [
    User(name: 'Zulfadhly', role: 'Barber', description: 'Experienced stylist')
  ];
  @override
  Future<void> addUser(User user) async {
    _users.add((user));
  }

  @override
  Future<List<User>> getAllUser() async {
    return [..._users];
  }

  @override
  Future<User> getUserById(String id) async {
    User user = _users.firstWhere((u) => u.name == id);
    return user;
  }
}