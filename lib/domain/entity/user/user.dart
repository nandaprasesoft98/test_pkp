import 'user_address.dart';
import 'user_company.dart';

class User {
  String id;
  String name;
  String username;
  String email;
  UserAddress userAddress;
  String phone;
  String website;
  UserCompany company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.userAddress,
    required this.phone,
    required this.website,
    required this.company
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          userAddress == other.userAddress &&
          phone == other.phone &&
          website == other.website &&
          company == other.company;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      userAddress.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;
}