import 'user_address_geo.dart';

class UserAddress {
  String street;
  String suite;
  String city;
  String zipcode;
  UserAddressGeo userAddressGeo;

  UserAddress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.userAddressGeo
  });
}